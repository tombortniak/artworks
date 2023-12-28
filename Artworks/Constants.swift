//
//  Constants.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 17/08/2023.
//

import Foundation

struct Constants {
    struct API {
        static let artistsURL = URL(string: "http://srv21.mikr.us:30123/api/v1/artists")
        static let artworksURL = URL(string: "http://srv21.mikr.us:30123/api/v1/artworks")
    }

    struct Format {
        static let lengthUnit = UnitLength.centimeters
    }

    struct Map {
        static let annotationIcon = "building.columns"
        static let earthCenterLatitude = 39.0
        static let earthCenterLongitude = 34.0
        static let latitudeDelta = 90.0
        static let longitudeDelta = 180.0
    }
}
