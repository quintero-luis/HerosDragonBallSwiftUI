//
//  ErrorView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import SwiftUI

struct ErrorView: View {
    @Environment(AppStateVM.self) var appState
    
    private var textError: String
    
    init(error: String) {
        self.textError = error
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundStyle(.red)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(textError)
                .foregroundStyle(.red)
                .font(.headline)
        }
        
        Button {
            // Back to login changing state
            appState.status = .none
        } label: {
            Text("Volver")
                .frame(width: 300, height: 300)
                .background(.orange)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ErrorView(error: "Error de prueba")
        .environment(AppStateVM())
}
