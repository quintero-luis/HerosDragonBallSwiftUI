//
//  HerosViewModel.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

@Observable
final class HerosViewModel {
    // Publishers
    var herosData = [HerosModel]()
    var filterUI: String = ""
    
    @ObservationIgnored
    private var useCaseHeros: HerosUseCasepProtocol
    
    init(useCase: HerosUseCasepProtocol = HerosUseCase()) {
        self.useCaseHeros = useCase
        
        Task {
            await self.getHeros()
        }
    }
    
    @MainActor // Esto cambia el UI (Héroes)
    func getHeros(newSearch: String = "") async {
        let data = await useCaseHeros.getHeros(filter: newSearch)
        self.herosData = data
    }
    
    // Favourite
    @MainActor
    func setLikeHero(idHero: String) async {
        // Call to server
        if (await useCaseHeros.setLikeHero(idHero: idHero)) {
            // Success call to server
            // Change Model Locally
            
            if let index = herosData.firstIndex(where: { $0.id.uuidString == idHero }) {
                herosData[index].favorite?.toggle() // Changes to the opposite
            }
            
            // Reload heros
            NotificationCenter.default.post(name: .kcNotificationReloadAlumnos, object: "Favorite hero changed")
                
        } else {
            // Error call to server
            NSLog("Error calling server to the endpoint like hero")
        }
    }
}
