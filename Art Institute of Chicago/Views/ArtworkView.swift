//
//  ArtworkView.swift
//  Art Institute of Chicago
//
//  Created by Vinnik Alexander on 01.07.2024.
//

import SwiftUI

struct ArtworkView: View {
    let artwork: Artwork
    var body: some View {
        NavigationLink {
            ArtworkDetailView(artwork: artwork)
        } label: {
            Text(artwork.title)
        }
    }
}

#Preview {
    ArtworkView(artwork: previewArtwork)
        .previewLayout(.sizeThatFits)
}
