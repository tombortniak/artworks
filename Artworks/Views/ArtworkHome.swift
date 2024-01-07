//
//  ArtworkHome.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 29/12/2023.
//

import SwiftUI

struct ArtworkHome: View {
    @State var artworks: [Artwork] = []
    var body: some View {
        TabView {
            Group {
                ArtworkList(artworks: $artworks)
                    .tabItem {
                        Label("Explore", systemImage: Constants.Navigation.exploreTabIcon)
                    }
                ArtworkMap(artworks: $artworks)
                    .tabItem {
                        Label("Map", systemImage: Constants.Navigation.mapTabIcon)
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.white, for: .tabBar)
        }
        .onAppear {
            Task {
                artworks = try await ArtworksAPI().getArtworks()
            }
        }
    }
}

#if !TESTING
#Preview {
    ArtworkHome()
}
#endif
