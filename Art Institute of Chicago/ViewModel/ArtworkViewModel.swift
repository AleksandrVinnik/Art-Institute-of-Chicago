//
//  ArtworkViewModel.swift
//  Art Institute of Chicago
//
//  Created by Vinnik Alexander on 01.07.2024.
//

import Combine
import Foundation

class ArtworkViewModel: ObservableObject {
    @Published private(set) var artworks = [Artwork]()
    @Published var currentPage = 1
    @Published var totalPages = 1
    @Published var startPage = 1
    @Published var totalArtworks = 0
    
    private var cancellables = Set<AnyCancellable>()
    private let jsonDecoder = JSONDecoder()
    private var isLoading = false
    
    func fetchArtwork(page: Int? = nil) {
        guard !isLoading else { return }
        isLoading = true
        
        let pageToFetch = page ?? (currentPage + 1)
        let urlString = "https://api.artic.edu/api/v1/artworks?page=\(pageToFetch)"
        guard let url = URL(string: urlString) else { return }
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ArtworkDataWorkResponse.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error \(error)")
                case .finished:
                    print("Request for page \(pageToFetch) completed successfully.")
                }
                self.isLoading = false
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                if page != nil {
                    self.artworks = response.data
                } else {
                    self.artworks.append(contentsOf: response.data)
                }
                self.currentPage = response.pagination.currentPage
                self.totalPages = response.pagination.totalPages
                self.totalArtworks = response.pagination.total
            }
            .store(in: &cancellables)
    }
    
    func jumpToPage(_ page: Int) {
        guard page > 0 && page <= totalPages else {
            print("Invalid page number")
            return
        }
        startPage = page
        currentPage = page
        artworks.removeAll()
        fetchArtwork(page: page)
    }
}

