//
//  ArtworkDetail.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 04/09/2023.
//

import SwiftUI


struct ArtworkDetail: View {
    var artwork: Artwork
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color.white
                    .frame(maxHeight: 200)
                    .ignoresSafeArea()
                Image(artwork.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200, alignment: .top)
                    .clipped()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(artwork.title)
                        .font(.largeTitle)
                        .bold()
                    Text(artists[0].name)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            List {
                Label(artwork.form.capitalized, systemImage: "theatermask.and.paintbrush")
                Label("\(artwork.location), \(artwork.city)", systemImage: "building.columns")
                Label(artists[0].period, systemImage: "hourglass")
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
struct ArtworkDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkDetail(artwork: artworks[0])
    }
}
#endif
