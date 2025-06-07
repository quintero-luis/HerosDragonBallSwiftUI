//
//  PrincipalView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import SwiftUI

struct PrincipalView: View {
    
//    @Environment(AppStateVM.self) private var appState
    
    // Cuando ponga 0 o 1 cambie de tab
    @State private var selection = 0
    
    var body: some View {
        // $ porque es una dirección de memoria
        TabView(selection: $selection) {
            // Tab Home
            HerosView()
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            
            AlumnosView()
            .tabItem {
                Image(systemName: "person")
                Text("Person")
            }
            .tag(1)
        }
        Button("Siguiente") {
            if selection == 1 {
                selection = 0
            } else {
                selection += 1
            }
        }
    }
}

#Preview {
    PrincipalView()
        .environment(AppStateVM())
}
