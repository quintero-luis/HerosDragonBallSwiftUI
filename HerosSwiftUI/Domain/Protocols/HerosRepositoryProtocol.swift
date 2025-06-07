//
//  HerosRepositoryProtocol.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation
protocol HerosRepositoryProtocol {
    func getHeros(filter: String) async -> [HerosModel]
    
    // Set favourite hero
    func setLikeHero(idHero: String) async -> Bool
}


