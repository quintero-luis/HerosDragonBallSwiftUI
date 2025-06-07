//
//  DefaultHerosRepository.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

final class HerosRepository: HerosRepositoryProtocol {

    private var Network: NetworkHerosProtocol
    
    init(Network: NetworkHerosProtocol = NetworkHeros()) {
        self.Network = Network
    }
    
    // Aquí se persistiría en CoreData
    func getHeros(filter: String) async -> [HerosModel] {
        return await Network.getHeros(filter: filter)
    }
    
    func setLikeHero(idHero: String) async -> Bool {
        return await Network.setLikeHero(idHero: idHero)
    }
    
}

// Mock
final class HerosRepositoryMock: HerosRepositoryProtocol {
    private var Network: NetworkHerosProtocol
    
    init(Network: NetworkHerosProtocol = NetworkHerosMock()) {
        self.Network = Network
    }
    
    func getHeros(filter: String) async -> [HerosModel] {
        return await Network.getHeros(filter: filter)
    }
    
    func setLikeHero(idHero: String) async -> Bool {
        return await Network.setLikeHero(idHero: idHero)
    }
    
}
