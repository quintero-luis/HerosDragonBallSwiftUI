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
    var status = Status.none // state de la llamada de red
    var tokenJWT: String = "" // Server´s JWT Token
    
    // Not publicated
    @ObservationIgnored
    var isLogged: Bool = false // Is the user logged or not
    
    
    
}
