//
//  ArtworkList.swift
//  Artworks
//
//  Created by Tomasz Bortniak on 26/08/2023.
//

import SwiftUI

struct ArtworkList: View {
    var body: some View {
        List(artworks, id: \.id) { artwork in
            ArtworkRow(artwork: artwork)
        }
    }
}

struct ArtworkList_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkList()
    }
}
