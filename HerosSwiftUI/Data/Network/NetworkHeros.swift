//
//  NetworkHeros.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

protocol NetworkHerosProtocol {
    func getHeros(filter: String) async -> [HerosModel]
    // Set favourite hero
    func setLikeHero(idHero: String) async -> Bool
}


final class NetworkHeros: NetworkHerosProtocol {
    // Set favourite hero
    func setLikeHero(idHero: String) async -> Bool {
        // Heros URL
        let urlCad: String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.like.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.post
        // Body:  name = ""
        request.httpBody = try? JSONEncoder().encode(HeroLikeRequest(hero: idHero))
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type")
        
        let jwtToken = KeyChainKC().loadKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
        if let tokenJWT = jwtToken {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        // Call to server
        do {
            let (_ , response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCES_CREATED {
                    return true // All OK
                }
            }
            
        } catch {
            // Error
            NSLog("Error calling heros")
        }
        
        return false
    }
    
    func getHeros(filter: String) async -> [HerosModel] {
        var modelReturn = [HerosModel]()
        
        // Heros URL
        let urlCad: String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.heros.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.post
        // Body:  name = ""
        request.httpBody = try? JSONEncoder().encode(HerosModelRequest(name: filter))
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type")
        
        let jwtToken = KeyChainKC().loadKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
        if let tokenJWT = jwtToken {
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        // Call to server
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCESS {
                    // Decode
                    modelReturn = try! JSONDecoder().decode([HerosModel].self, from: data)
                }
            }
        } catch {
            // Error
            NSLog("Error calling heros")
        }
        return modelReturn
    }
}


// Mock Class

final class NetworkHerosMock: NetworkHerosProtocol {
    // Set favourite hero
    func setLikeHero(idHero: String) async -> Bool {
        return true
    }
    
    func getHeros(filter: String) async -> [HerosModel] {
        let model1 = HerosModel(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300" , favorite: true)

                let model2 = HerosModel(id: UUID(), name: "Vegeta", description: "Vegeta es todo lo contrario. Es arrogante, cruel y despreciable. Quiere conseguir las bolas de Dragón y se enfrenta a todos los protagonistas, matando a Yamcha, Ten Shin Han, Piccolo y Chaos. Es despreciable porque no duda en matar a Nappa, quien entonces era su compañero, como castigo por su fracaso. Tras el intenso entrenamiento de Goku, el guerrero se enfrenta a Vegeta y estuvo a punto de morir. Lejos de sobreponerse, Vegeta huye del planeta Tierra sin saber que pronto tendrá que unirse a los que considera sus enemigos.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300" , favorite: true)

                return [model1, model2]
    }
}
