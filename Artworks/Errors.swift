//
//  Errors.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 19/08/2023.
//

import Foundation

enum ArtworksAPIError: Error {
    case invalidQuery
}

extension ArtworksAPIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidQuery:
            return "Provided query is invalid. Either query key or value is empty."
        }
    }
}
