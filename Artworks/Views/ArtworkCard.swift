//
//  ArtworkRow.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import SwiftUI

struct ArtworkCard: View {
    var artwork: Artwork
    @State var artist: Artist? = nil

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: artwork.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                } else if phase.error != nil {
                    Color.red
                } else {
                    Color.gray
                }
            }
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
                Text(artist?.name ?? "")
                    .font(.caption)
                    .task {
                        do {
                            artist = try await ArtworksAPI().getArtist(id: artwork.artistId!)
                        } catch {}
                    }
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
#Preview {
    ArtworkCard(artwork: dummyArtworks[0])
}
#endif
