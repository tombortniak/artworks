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
    var artist: Artist
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

    static func == (lhs: Artwork, rhs: Artwork) -> Bool {
        return lhs.title == rhs.title && lhs.artist.name == rhs.artist.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
