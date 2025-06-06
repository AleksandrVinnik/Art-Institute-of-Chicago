//
//  Artwork.swift
//  Art Institute of Chicago
//
//  Created by Vinnik Alexander on 01.07.2024.
//

struct ArtworkDataWorkResponse: Decodable {
    let data: [Artwork]
    let pagination: Pagination
}

struct Pagination: Decodable {
    let total: Int
    let limit: Int
    let offset: Int
    let totalPages: Int
    let currentPage: Int
    let nextUrl: String?
}

struct Artwork: Decodable, Identifiable {
    let id: Int
    let title: String
    let imageId: String?
}


let previewArtwork = Artwork(id: 16487, title: "The Bay of Marseille, Seen from L\'Estaque", imageId: "d4ca6321-8656-3d3f-a362-2ee297b2b813")
