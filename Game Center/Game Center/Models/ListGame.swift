//
//  ListGame.swift
//  Game Center
//
//  Created by Dicoding Reviewer on 16/08/21.
//

import Foundation

// MARK: - ListGame
struct ListGame: Codable {
    let results: [Game]?
    let next: String?
    let previous: String?
    
    enum CodingKeys: String, CodingKey {
        case results, next, previous
    }
}

// MARK: - Game
struct Game: Codable, Identifiable {
    let id: Int
    let name, released: String
    let backgroundImage: String?
    let rating: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case name, released, rating
        case backgroundImage = "background_image"
    }
}
