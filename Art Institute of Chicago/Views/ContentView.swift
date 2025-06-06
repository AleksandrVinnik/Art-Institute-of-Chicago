//
//  ContentView.swift
//  Art Institute of Chicago
//
//  Created by Vinnik Alexander on 01.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArtworkViewModel()
    @State private var jumpToPageText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Jump to page", text: $jumpToPageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    
                    Button("Go") {
                        if let page = Int(jumpToPageText), page > 0, page <= viewModel.totalPages {
                            viewModel.jumpToPage(page)
                        }
                    }
                }
                .padding()
                
                List {
                    ForEach(viewModel.artworks) { artwork in
                        ArtworkView(artwork: artwork)
                    }
                    if viewModel.currentPage < viewModel.totalPages {
                        ProgressView()
                            .onAppear {
                                viewModel.fetchArtwork(page: viewModel.currentPage + 1)
                            }
                    }
                }
                .navigationTitle("Artworks")
                
                Text("Pages from: \(viewModel.startPage) to \(viewModel.currentPage)  (total pages: \(viewModel.totalPages))")
            }
        }
        .onAppear {
            viewModel.fetchArtwork()
        }
    }
}
