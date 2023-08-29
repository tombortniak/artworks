//
//  ArtworkRow.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import SwiftUI

struct ArtworkCard: View {
    var artwork: Artwork

    var body: some View {
        HStack {
            Image(artwork.image)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120, alignment: .top)
                .clipped()
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text(artwork.title)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                Text(artists[0].name)
            }
            Spacer()
        }
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(
                    color: Color.gray.opacity(0.5),
                    radius: 5
                )
        )
    }
}

#if !TESTING
struct ArtworkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtworkCard(artwork: artworks[0])
            ArtworkCard(artwork: artworks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
