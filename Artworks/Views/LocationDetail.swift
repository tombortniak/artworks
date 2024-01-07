//
//  LocationDetail.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 05/01/2024.
//

import SwiftUI

struct LocationDetail: View {
    @Binding var selectedLocation: Location?
    var body: some View {
        NavigationStack {
            VStack {
                Text(selectedLocation?.name ?? "")
                    .font(.title2)
                    .bold()
                List(selectedLocation?.artworks ?? [], id: \.self) { artwork in
                    NavigationLink {
                        ArtworkDetail(artwork: artwork)
                    } label: {
                        ArtworkCard(artwork: artwork)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
        }
        .padding([.bottom, .top], 25)
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
}

#if !TESTING
#Preview {
    @State var location: Location? = Location(name: "Louvre", coords: Coords(latitude: dummyArtworks.first!.latitude, longitude: dummyArtworks.first!.longitude), artworks: dummyArtworks)
    return LocationDetail(selectedLocation: $location)
}
#endif
