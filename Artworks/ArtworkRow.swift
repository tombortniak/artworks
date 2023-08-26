//
//  ArtworkRow.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import SwiftUI

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

#if !TESTING
struct ArtworkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtworkRow(artwork: artworks[0])
            ArtworkRow(artwork: artworks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
