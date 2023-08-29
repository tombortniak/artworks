//
//  ModelData.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import Foundation

var artworks: [Artwork] = load("artworkData.json")
var artists: [Artist] = load("artistData.json")

func load<T: Decodable>(_ filename: String) -> [T] {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([T].self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \([T].self):\n\(error)")
    }
}
