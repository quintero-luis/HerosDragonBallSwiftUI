//
//  Endpoints.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import Foundation

enum Endpoints: String {
    case login = "/auth/login"
    case heros = "/heros/all"
    case like = "/data/herolike" // Favourite Hero
    
    case alumnos = "/data/developers"
    case bootcamps = "data/bootcamps"
}
