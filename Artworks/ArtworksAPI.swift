//
//  ArtworksAPI.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

class ArtworksAPI {
    static var artists = [
        Artist(id: 1, name: "Leonardo da Vinci", country: "Italy", period: "Renaissance"),
        Artist(id: 2, name: "Michelangelo", country: "Italy", period: "Renaissance")
    ]

    static var artworks = [
        Artwork(id: 1, title: "Mona Lisa", image: "image1", artistId: 1, location: "Louvre", city: "Paris", country: "France", continent: "Europe"),
        Artwork(id: 2, title: "The Last Judgement", image: "image2", artistId: 2, location: "Sistine Chapel", city: "Vatican City", country: "Vatican City", continent: "Europe")
    ]
}
