//
//  ArtworkRow.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import SwiftUI

let artworks: [Artwork] = [
    Artwork(id: 1, title: "Mona Lisa", image: "mona_lisa", artistId: 1, location: "Louvre", city: "Paris", country: "France", continent: "Europe"),
    Artwork(id: 2, title: "The Last Judgement", image: "the_last_judgement", artistId: 2, location: "Sistine Chapel", city: "Vatican City", country: "Vatican City", continent: "Europe")
]

struct ArtworkRow: View {
    var artwork: Artwork

    var body: some View {
        HStack {
            Image(artwork.image)
                .resizable()
                .frame(width: 50, height: 50)
            Text(artwork.title)
            Spacer()
        }
    }
}

struct ArtworkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtworkRow(artwork: artworks[0])
            ArtworkRow(artwork: artworks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
