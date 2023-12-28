//
//  ArtworkMap.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 27/12/2023.
//

import SwiftUI
import MapKit

struct ArtworkMap: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.0, longitude: 34.0), span: MKCoordinateSpan(latitudeDelta: 90, longitudeDelta: 180)))
    var body: some View {
        Map(position: $position) {
            ForEach(artworks) { artwork in
                Marker(artwork.title, systemImage: Constants.Map.markerIcon, coordinate: CLLocationCoordinate2D(latitude: artwork.latitude, longitude: artwork.longitude))
            }
        }
        .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ArtworkMap()
}
