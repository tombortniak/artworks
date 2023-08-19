//
//  ArtworksAPI.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 10/08/2023.
//

import Foundation

class ArtworksAPI {
    static let artists: [Artist] = [
        Artist(id: 1, name: "Leonardo da Vinci", country: "Italy", period: "Renaissance"),
        Artist(id: 2, name: "Michelangelo", country: "Italy", period: "Renaissance")
    ]

    static let artworks: [Artwork] = [
        Artwork(id: 1, title: "Mona Lisa", image: "image1", artistId: 1, location: "Louvre", city: "Paris", country: "France", continent: "Europe"),
        Artwork(id: 2, title: "The Last Judgement", image: "image2", artistId: 2, location: "Sistine Chapel", city: "Vatican City", country: "Vatican City", continent: "Europe")
    ]

    private func isQueryValid(with queryParameters: [String:String]) -> Bool {
        if queryParameters.keys.contains("") || queryParameters.values.contains("") {
            return false
        } else {
            return true
        }
    }

    func appending(queryParameters: [String:String], to url: URL) throws -> URL {
        guard isQueryValid(with: queryParameters) else {
            throw ArtworksAPIError.invalidQuery
        }
        var constructedURL = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        constructedURL.queryItems = queryParameters.map { URLQueryItem(name: $0, value: $1)}.sorted { $0.name < $1.name }
        return constructedURL.url!
    }
}
