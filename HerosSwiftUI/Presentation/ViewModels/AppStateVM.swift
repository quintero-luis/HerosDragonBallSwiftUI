//
//  AppStateVM.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import Foundation

@Observable
final class AppStateVM {
    // Publicated
    // When they change, the ui change
    var status = Status.none // state de la llamada de red
    var tokenJWT: String = "" // Server´s JWT Token
    
    // Not publicated
    @ObservationIgnored
    var isLogged: Bool = false // Is the user logged or not
    
    
    // Dependencies
    private var loginUserCase: LoginUseCaseProtocol
    
    init(loginUserCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUserCase = loginUserCase
        
        // Autologin
        Task {
            await self.validateControlLogin()
        }
    }
    
    // Functions
    // This file is using a Observable object
    @MainActor // Instead of dispatchqueue
    func loginApp(user: String, pass: String) {
        self.status = .loading
        Task {
            if (await loginUserCase.loginApp(user: user, password: pass)) {
                // Login OK
                self.status = .loaded
            } else {
                //Login Error
                self.status = .error(error: "Error usuario clave")
            }
        }
    }
    
    @MainActor
    func closeSessionUser() {
        // Asyncrhonous func, needs a asyncronouse ambiente (Task)
        Task {
            await loginUserCase.logout()
            // This is on the main thread, so we need dispatchQueue, instead, we write @MainActor
            self.status = .none
        }
    }
    
    @MainActor
    func validateControlLogin() {
        Task {
            if (await loginUserCase.validateToken()) {
                // Token succesful -> to the home
                self.status = .loaded
            } else {
                self.status = .none
            }
        }
    }
    
}
