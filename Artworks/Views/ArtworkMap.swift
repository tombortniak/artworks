//
//  ArtworkMap.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 27/12/2023.
//

import SwiftUI
import MapKit

struct ArtworkMap: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Constants.Map.earthCenterLatitude, longitude: Constants.Map.earthCenterLongitude), span: MKCoordinateSpan(latitudeDelta: Constants.Map.latitudeDelta, longitudeDelta: Constants.Map.longitudeDelta)))
    var body: some View {
        Map(position: $position) {
            ForEach(artworks) { artwork in
                Annotation(artwork.title, coordinate: CLLocationCoordinate2D(latitude: artwork.latitude, longitude: artwork.longitude)) {
                    ZStack {
                        Circle()
                            .fill(.background)
                        Image(systemName: Constants.Map.annotationIcon)
                            .padding(5)
                    }
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ArtworkMap()
}
