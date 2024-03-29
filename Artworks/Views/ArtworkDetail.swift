//
//  ArtworkDetail.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 04/09/2023.
//

import SwiftUI

enum CustomError: Error {
    case invalidSelection
}

struct ArtworkDetail: View {
    var artwork: Artwork

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
                    Text(artwork.artist.name)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            List {
                Label(artwork.form.capitalized, systemImage: "theatermask.and.paintbrush")
                Label("\(artwork.location), \(artwork.city)", systemImage: "building.columns")
                Label(artwork.artist.period, systemImage: "hourglass")
                Label(getSpan(startYear: artwork.yearStarted, endYear: artwork.yearCompleted), systemImage: "calendar")
                Label(getDimensions(height: artwork.height, width: artwork.width), systemImage: "pencil.and.ruler")
                Text("[Find out more](\(artwork.descriptionLink!))")
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
