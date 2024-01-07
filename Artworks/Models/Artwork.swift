//
//  Artwork.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

struct Artwork: Codable, Identifiable, Hashable {
    var id: Int
    var title: String
    var image: String
    var artistId: Int?
    var location: String
    var city: String
    var country: String
    var continent: String
    var form: String
    var yearStarted: Int
    var yearCompleted: Int?
    var descriptionLink: String?
    var height: Double?
    var width: Double?
    var latitude: Double
    var longitude: Double
}
