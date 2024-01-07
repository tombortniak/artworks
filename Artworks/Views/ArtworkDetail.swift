//
//  ArtworkDetail.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 04/09/2023.
//

import SwiftUI


struct ArtworkDetail: View {
    var artwork: Artwork
    @State var artist: Artist? = nil

    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.white
                    .frame(maxHeight: 200)
                    .ignoresSafeArea()
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
                .scaledToFit()
                .frame(maxHeight: 200, alignment: .top)
                .clipped()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(artwork.title)
                        .font(.largeTitle)
                        .bold()
                    Text(dummyArtists[0].name)
                        .font(.subheadline)
                        .task {
                            do {
                                artist = try await ArtworksAPI().getArtists(queryParameters: ["id": "\(artwork.artistId!)"]).first
                            } catch {}
                        }
                }
                Spacer()
            }
            .padding()
            List {
                Label(artwork.form.capitalized, systemImage: "theatermask.and.paintbrush")
                Label("\(artwork.location), \(artwork.city)", systemImage: "building.columns")
                Label(dummyArtists[0].period, systemImage: "hourglass")
                Label(getSpan(startYear: artwork.yearStarted, endYear: artwork.yearCompleted), systemImage: "calendar")
                Label(getDimensions(height: artwork.height, width: artwork.width), systemImage: "pencil.and.ruler")
                Label(artwork.descriptionLink ?? "", systemImage: "link")
            }
            .listStyle(.plain)
            .scrollDisabled(true)
        }
    }
}

#if !TESTING
#Preview {
    ArtworkDetail(artwork: dummyArtworks[0])
}
#endif
