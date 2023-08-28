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
                .frame(width: 150, height: 150, alignment: .top)
                .clipped()
            Spacer()
            VStack(spacing: 5) {
                Text(artwork.title)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                Text(artists[0].name)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundColor(.black)
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
