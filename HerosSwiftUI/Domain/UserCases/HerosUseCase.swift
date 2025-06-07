//
//  HerosUseCase.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

//protocol

protocol HerosUseCasepProtocol {
    var repo: HerosRepositoryProtocol {get set}
    
    func getHeros(filter: String) async -> [HerosModel]
    func setLikeHero(idHero: String) async -> Bool
}

final class HerosUseCase: HerosUseCasepProtocol {
    
    var repo: any HerosRepositoryProtocol
    
    init(repo: any HerosRepositoryProtocol = HerosRepository(Network: NetworkHeros())) {
        self.repo = repo
    }
    
    func getHeros(filter: String) async -> [HerosModel] {
        return await repo.getHeros(filter: filter)
    }
    
    func setLikeHero(idHero: String) async -> Bool {
        return await repo.setLikeHero(idHero: idHero)
    }
}


// Mock

final class HerosUseCaseMock: HerosUseCasepProtocol {
    var repo: any HerosRepositoryProtocol
    
    init(repo: any HerosRepositoryProtocol = HerosRepositoryMock()) {
        self.repo = repo
    }
    
    func getHeros(filter: String) async -> [HerosModel] {
        return await repo.getHeros(filter: filter)
    }
    
    func setLikeHero(idHero: String) async -> Bool {
        return await repo.setLikeHero(idHero: idHero)
    }
}
