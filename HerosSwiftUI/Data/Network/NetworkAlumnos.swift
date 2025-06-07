//
//  NetworkAlumnos.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import Foundation

protocol NetworkAlumnosProtocol {
    func getAlumnos() async -> [AlumnosModel]
}


final class NetworkAlumnos: NetworkAlumnosProtocol {
    func getAlumnos() async -> [AlumnosModel] {
        var modelReturn = [AlumnosModel]()
        
        // Heros URL
        let urlCad: String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.alumnos.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        // Body:  name = ""
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type")
        
        let jwtToken = KeyChainKC().loadKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
        if let tokenJWT = jwtToken {
            // Add security header
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        // Call to server
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCESS {
                    // Decode
                    modelReturn = try! JSONDecoder().decode([AlumnosModel].self, from: data)
                }
            }
        } catch {
            // Error
            NSLog("Error calling heros")
        }
        return modelReturn
    }
}





final class NetworkAlumnosMock: NetworkAlumnosProtocol {
    func getAlumnos() async -> [AlumnosModel] {
        // Search json file
        guard let url = Bundle.main.url(forResource: "alumnos", withExtension: "json") else {
            return [AlumnosModel]()
        }
        
        do {
            let data = try Data(contentsOf: url)
            let bootcamps = try JSONDecoder().decode([AlumnosModel].self, from: data)
            
            return bootcamps
        } catch {
            return [AlumnosModel]()
        }
    }
}


// 1:29
