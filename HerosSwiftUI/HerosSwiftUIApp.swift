//
//  HerosSwiftUIApp.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import SwiftUI
import TipKit

@main
struct HerosSwiftUIApp: App {
    
    @State var AppState = AppStateVM()
    
    // Tip
    init() {
        try? Tips.configure()
        try? Tips.resetDatastore() // Resetea el número de veces visto a 0
        
    }
    
    var body: some Scene {
        WindowGroup {
            // Instantiate Enrutador de vistas
            RootView()
                .environment(AppState)
        }
    }
}
