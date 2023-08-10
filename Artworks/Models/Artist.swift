//
//  Artist.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

class Artist: Codable {
    var id: Int
    var name: String
    var country: String
    var period: String

    init(id: Int, name: String, country: String, period: String) {
        self.id = id
        self.name = name
        self.country = country
        self.period = period
    }
}
