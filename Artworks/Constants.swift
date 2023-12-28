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
        static let markerIcon = "building.columns.circle.fill"
    }
}
