//
//  ArtworkMap.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 27/12/2023.
//

import SwiftUI
import MapKit

func getLocations(artworks: [Artwork]) -> [Location] {
    let groupedArtworks = Dictionary(grouping: artworks, by: { Coords(latitude: $0.latitude, longitude: $0.longitude)})
    let locations = groupedArtworks.keys.map { Location(name: groupedArtworks[$0]!.first!.location, coords: $0, artworks: groupedArtworks[$0]!) }
    return locations
}

struct ArtworkMap: View {
    @Binding var artworks: [Artwork]
    @State var isSheetPresented: Bool
    @State var position: MapCameraPosition
    @State var selectedLocation: Location?
    var locations: [Location] = []

    init(artworks: Binding<[Artwork]>) {
        self._artworks = artworks
        self._isSheetPresented = State(initialValue: false)
        self._position = State(initialValue: MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Constants.Map.earthCenterLatitude, longitude: Constants.Map.earthCenterLongitude), span: MKCoordinateSpan(latitudeDelta: Constants.Map.latitudeDelta, longitudeDelta: Constants.Map.longitudeDelta))))
        self.locations = getLocations(artworks: self.artworks)

    }

    var body: some View {
        Map(position: $position) {
            ForEach(locations, id: \.self) { location in
                Annotation(location.name, coordinate: CLLocationCoordinate2D(latitude: location.coords.latitude, longitude: location.coords.longitude)) {
                    ZStack {
                        Circle()
                            .fill(.background)
                        Image(systemName: Constants.Map.annotationIcon)
                            .padding(5)
                    }
                    .onTapGesture {
                        selectedLocation = location
                        isSheetPresented = true
                    }
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .sheet(isPresented: $isSheetPresented, onDismiss: { isSheetPresented = false }) {
            LocationDetail(selectedLocation: $selectedLocation)
        }
    }
}

#if !TESTING
#Preview {
    @State var artworks = dummyArtworks
    return ArtworkMap(artworks: $artworks)
}
#endif
