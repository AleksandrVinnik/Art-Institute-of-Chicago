//
//  ArtworkDetailView.swift
//  Art Institute of Chicago
//
//  Created by Vinnik Alexander on 01.07.2024.
//

import SwiftUI

struct ArtworkDetailView: View {
    let artwork: Artwork

    var body: some View {
        ScrollView {
            
            artWorkImageView
            
            Text(artwork.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
        }
        .navigationTitle("Artwork Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder var artWorkImageView: some View {
        if let imageId = artwork.imageId,
           let imageURL = URL(string: "https://www.artic.edu/iiif/2/\(imageId)/full/843,/0/default.jpg"){
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                 ProgressView()
            }
        } else {
            Text("Image is not available")
        }
        
    }
    
}

#Preview {
    ArtworkDetailView(artwork: previewArtwork)
}
