//
//  ArtworkMap.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 27/12/2023.
//

import SwiftUI
import MapKit

struct CoordsGroupingKey: Hashable {
    let latitude: Double
    let longitude: Double
}

struct ArtworkMap: View {
    @State var isSheetPresented = false
    @State var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Constants.Map.earthCenterLatitude, longitude: Constants.Map.earthCenterLongitude), span: MKCoordinateSpan(latitudeDelta: Constants.Map.latitudeDelta, longitudeDelta: Constants.Map.longitudeDelta)))
    var groupedArtworks = Dictionary(grouping: artworks, by: { CoordsGroupingKey(latitude: $0.latitude, longitude: $0.longitude)})
    var body: some View {
        Map(position: $position) {
            ForEach(Array(groupedArtworks.values), id: \.self) { artworks in
                Annotation(artworks.first?.location ?? "", coordinate: CLLocationCoordinate2D(latitude: artworks.first!.latitude, longitude: artworks.first!.longitude)) {
                    ZStack {
                        Circle()
                            .fill(.background)
                        Image(systemName: Constants.Map.annotationIcon)
                            .padding(5)
                    }
                    .onTapGesture {
                        isSheetPresented = true
                    }
                }
                .annotationTitles(.hidden)
            }
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .sheet(isPresented: $isSheetPresented) {
            VStack {
                Text(artworks.first!.location)
                    .font(.title2)
                    .bold()
                List(artworks, id: \.self) { artwork in
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
}

#if !TESTING
#Preview {
    ArtworkMap()
}
#endif
