//
//  Pokemon.swift
//  pokedex
//
//  Created by Lucas Parreira on 2/05/21.
//

import Foundation
import SwiftUI
import Combine


struct Pokemon: Decodable, Identifiable {
    var id: Int
    var name: String
    var imageUrl: String
    var type: String
    var description: String
}

let MOCK_POKEMON:[Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "pokemon", type: "poison",description: "..."),
    .init(id: 1, name: "Pikachu", imageUrl: "pokemon", type: "eletric",description: "..."),
    .init(id: 2, name: "Square", imageUrl: "pokemon", type: "poison",description: "..."),
    .init(id: 3, name: "Charizard", imageUrl: "pokemon", type: "fire",description: "...")
]
