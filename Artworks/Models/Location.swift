//
//  Location.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 05/01/2024.
//

import Foundation

struct Location: Hashable {
    let name: String
    let coords: Coords
    let artworks: [Artwork]
}
