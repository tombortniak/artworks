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

    func getData<T: Decodable>(with queryParameters: [String:String], from url: URL) async throws -> [T] {
        var endpointURL = url
        if !queryParameters.isEmpty {
            endpointURL = try appending(queryParameters: queryParameters, to: url)
        }
        let (data, _) = try await URLSession.shared.data(from: endpointURL)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode([T].self, from: data)
        return decoded
    }

    func getArtworks(queryParameters: [String:String] = [:]) async throws -> [Artwork] {
        let url = Constants.API.artworksURL!
        let artworks: [Artwork] = try await getData(with: queryParameters, from: url)
        return artworks
    }

    func getArtists(queryParameters: [String:String] = [:]) async throws -> [Artist] {
        let url = Constants.API.artistsURL!
        let artists: [Artist] = try await getData(with: queryParameters, from: url)
        return artists
    }
}
