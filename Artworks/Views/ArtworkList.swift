//
//  ArtworkList.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import SwiftUI

struct ArtworkList: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List(filteredArtworks, id: \.self) { artwork in
                ArtworkCard(artwork: artwork)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Artworks")
        }
        .searchable(text: $searchText) {
            ForEach(filteredArtworks, id: \.self) { artwork in
                Text(artwork.title).searchCompletion(artwork.title)
            }
        }
    }

    var filteredArtworks: [Artwork] {
        if searchText.isEmpty {
            return artworks
        } else {
            return artworks.filter { $0.title.contains(searchText) }
        }
    }
}

#if !TESTING
struct ArtworkList_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkList()
    }
}
#endif
