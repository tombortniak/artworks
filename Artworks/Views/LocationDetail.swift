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
        VStack {
            Text(selectedLocation?.name ?? "")
                .font(.title2)
                .bold()
            List(selectedLocation?.artworks ?? [], id: \.self) { artwork in
                ArtworkCard(artwork: artwork)
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
        .padding([.bottom, .top], 25)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}

#if !TESTING
#Preview {
    @State var location: Location? = Location(name: "Louvre", coords: Coords(latitude: artworks.first!.latitude, longitude: artworks.first!.longitude), artworks: artworks)
    return LocationDetail(selectedLocation: $location)
}
#endif
