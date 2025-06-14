# iOS App - Art Institute of Chicago Explorer
https://img.shields.io/badge/Swift-5.9-orange.svg
https://img.shields.io/badge/platform-iOS-blue.svg

Explore the vast collection of artworks from the Art Institute of Chicago directly on your iOS device. This SwiftUI application provides a seamless browsing experience with paginated loading and detailed artwork views using the museum's public API.

## Features

📜 Paginated Artwork List - Infinite scrolling with automatic loading
🔢 Page Navigation - Jump to specific pages with page number input
🖼️ High-Resolution Images - IIIF protocol for optimized image delivery
📱 Modern SwiftUI Interface - Clean, responsive design
⚡️ Efficient Data Handling - Combine framework for API requests
🧩 MVVM Architecture - Well-structured code separation
🔄 Real-time Pagination Tracking - Current page and total pages display

## Data Flow Architecture

graph TD
    A[ContentView] -->|Observes| B[ArtworkViewModel]
    B -->|Requests Data| C[Art Institute API]
    C -->|Returns JSON| B
    B -->|Parses Response| D[Artwork Model]
    D -->|Updates View| A
    A -->|User Selects| E[ArtworkDetailView]
    E -->|Requests Image| F[IIIF Image API]
    F -->|Returns Image| E
    E -->|Displays Image| G[AsyncImage]


## Data Flow Diagram

graph TD
    A[ArtworkViewModel] -->|Requests| B[Art Institute API]
    B -->|JSON Response| C[ArtworkDataWorkResponse]
    C --> D[Artwork Model]
    D -->|Displays| E[ContentView - List]
    E -->|Selects| F[ArtworkDetailView]
    F -->|Requests| G[IIIF Image API]
    G -->|Image Data| H[AsyncImage View]

## Requirements

iOS 16.0+
Xcode 15.0+
Swift 5.9+
Installation

Clone the repository:
bash
git clone https://github.com/your-username/art-institute-explorer.git
Open the project in Xcode:
bash
cd art-institute-explorer
open Art\ Institute\ of\ Chicago.xcodeproj
Build and run the project (⌘ + R)

## Usage

Browsing Artworks

The main screen displays a paginated list of artworks
Scroll to load more artworks automatically
Use the page navigation at the bottom to track your position
Jumping to Specific Pages

Enter a page number in the text field
Press "Go" to navigate directly to that page
Viewing Artwork Details

Tap any artwork title in the list
View artwork details including title and high-resolution image
Use the navigation bar to return to the list
API Reference

This application uses the Art Institute of Chicago API:

## Artwork List Endpoint

List of artworks Endpoint:
GET https://api.artic.edu/api/v1/artworks?page={page}
 

Endpoint for an artwork with imageId:
GET https://www.artic.edu/iiif/2/{imageId}/full/843,/0/default.jpg

## Code Structure

text
├── Models
│   ├── Artwork.swift            # Artwork data model
│   └── Pagination.swift         # Pagination metadata
├── ViewModels
│   └── ArtworkViewModel.swift   # Manages data fetching and state
├── Views
│   ├── ContentView.swift        # Main artwork list view
│   ├── ArtworkView.swift        # Artwork list item
│   └── ArtworkDetailView.swift  # Artwork detail view
└── Art_Institute_of_ChicagoApp.swift # App entry point


License

Distributed under the MIT License. See LICENSE for more information.
