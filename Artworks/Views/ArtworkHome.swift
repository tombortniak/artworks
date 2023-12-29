//
//  ArtworkHome.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 29/12/2023.
//

import SwiftUI

struct ArtworkHome: View {
    var body: some View {
        TabView {
            Group {
                ArtworkList()
                    .tabItem {
                        Label("Explore", systemImage: Constants.Navigation.exploreTabIcon)
                    }
                ArtworkMap()
                    .tabItem {
                        Label("Map", systemImage: Constants.Navigation.mapTabIcon)
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.white, for: .tabBar)
        }
    }
}

#if !TESTING
#Preview {
    ArtworkHome()
}
#endif
