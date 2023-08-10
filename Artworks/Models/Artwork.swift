//
//  Artwork.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

class Artwork: Codable {
    var id: Int
    var title: String
    var image: String
    var artistId: Int
    var location: String
    var city: String
    var country: String
    var continent: String

    init(id: Int, title: String, image: String, artistId: Int, location: String, city: String, country: String, continent: String) {
        self.id = id
        self.title = title
        self.image = image
        self.artistId = artistId
        self.location = location
        self.city = city
        self.country = country
        self.continent = continent
    }
}
