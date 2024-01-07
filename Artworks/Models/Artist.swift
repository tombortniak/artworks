//
//  Artist.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

struct Artist: Codable, Identifiable {
    var id: Int
    var name: String
    var country: String
    var period: String
}
