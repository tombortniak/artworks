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
                .frame(width: 100, height: 100, alignment: .top)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 6.0, bottomLeadingRadius: 6.0, bottomTrailingRadius: 0.0, topTrailingRadius: 0.0))
                .clipped()
            Spacer()
            VStack(alignment: .center, spacing: 5) {
                Text(artwork.title)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.center)
                Text(artists[0].name)
                    .font(.caption)
            }
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 6.0)
                .fill(Color.white)
                .shadow(
                    color: Color.gray.opacity(0.5),
                    radius: 3
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
