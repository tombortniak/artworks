//
//  Artwork.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

struct Artwork: Codable {
    var id: Int
    var title: String
    var image: String
    var artistId: Int
    var location: String
    var city: String
    var country: String
    var continent: String
}
