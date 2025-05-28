//
//  NetworkLogin.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import Foundation

// Protocol
protocol NetworkLoginProtocol {
    func loginApp(user: String, password: String) async -> String
}

final class NetworkLogin: NetworkLoginProtocol {
    func loginApp(user: String, password: String) async -> String {
        var tokenJWT = ""
        
        // Make url
        let urlCad : String = "\(ConstantsApp.CONST_API_URL)\(Endpoints.login.rawValue)"
        let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var SegCredential = ""
        if let credential = encodeCredentials {
            SegCredential = "Basic \(credential)"
        }
        
        // Creo la request
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.post
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type") /// The value of the header field
        request.addValue(SegCredential, forHTTPHeaderField: "Authorization")
        
        // Call to server
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCES {
                    tokenJWT = String(decoding: data, as: UTF8.self)
                }
            }
        } catch {
            tokenJWT = ""
        }
        
        return tokenJWT
    }
}

// Login Mock

final class NetworkLoginMock: NetworkLoginProtocol {
    func loginApp(user: String, password: String) async -> String {
        return UUID().uuidString
    }
    
    
    
    
}

// Authorization: Basic YmfsuifghogjaoIFnfnFJKnfljjhf
// Basic usuario:clave en base64
