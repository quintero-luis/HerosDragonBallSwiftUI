//
//  LoginUseCase.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import Foundation

protocol LoginUseCaseProtocol {
    // Have a reference to repository
    var repo: LoginRepositoryProtocol {get set}
    
    // Functions
    
    func loginApp(user: String, password: String) async -> Bool
    // Async because sometimes we need to call the server to logout
    func logout() async -> Void
    func validateToken() async -> Bool
}

// Use Case

final class LoginUseCase: LoginUseCaseProtocol {
    var repo: any LoginRepositoryProtocol
    
    @kcPersistenceKeyChain(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
    var tokenJWT // Puntero a la clase de arriba
    
    init(repo: LoginRepositoryProtocol = DefaultLoginRepository()) {
        self.repo = repo
    }
    
    /// Login in the app
    func loginApp(user: String, password: String) async -> Bool {
        let token = await repo.loginApp(user: user, password: password)
        // Save token in KeyChain
        if token != "" {
//            KeyChainKC().saveKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN, value: token)
            tokenJWT = token
            return true
        } else {
            // Delete clave
//            KeyChainKC().deleteKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
            tokenJWT = ""
            return false
        }
    }
    
    func logout() async {
        // Server doesnt have a logout func, so we just delete the token
        KeyChainKC().deleteKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
    }
    
    // Validate is token is correct
    func validateToken() async -> Bool {
        
        // REMEBER: Caducidad on token time
        
//        if KeyChainKC().loadKC(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN) != "" {
        if tokenJWT != "" {
            return true
        } else {
            return false
        }
    }
    
    
    
    
}
