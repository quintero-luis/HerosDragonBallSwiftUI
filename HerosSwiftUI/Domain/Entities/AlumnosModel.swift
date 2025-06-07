//
//  AlumnosModel.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation

struct AlumnosModel: Codable, Identifiable {
    let id: String
    let email: String
    let apell1, apell2: String
    let name: String
    let photo: String?
    let bootcamp: BootcampModel // Classmate bootcamp
    let heros: [HerosModel] // Favorite classmate hero
    
}

// Lista de bootcamps
struct BootcampModel: Codable, Identifiable {
    let id, name: String
}
