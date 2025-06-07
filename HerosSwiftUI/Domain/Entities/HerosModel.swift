//
//  HerosModel.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation
// Codificar, hacer switch,  12:40, when passing from a secondary thread to a main thread it sends
struct HerosModel : Codable, Identifiable, Sendable {
    var id: UUID
    var name: String
    var description: String
    var photo: String
    var favorite: Bool? // Optional is user has marked as favorite, different for all users
}

extension HerosModel {
    func getInfoHero() -> String {
        // return "Heroe: \(name)"
        return name
    }
}

// Request filter of names
struct HerosModelRequest : Codable, Sendable {
    var name: String
}

// Request set favourite hero  /api/data/herolike
struct HeroLikeRequest: Codable {
    var hero: String
}
