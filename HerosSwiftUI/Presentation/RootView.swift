//
//  RootView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import SwiftUI

struct RootView: View {
    @Environment(AppStateVM.self) var appState
    var body: some View {
        switch (appState.status) {
        case .none:
            LoginView()
        case .register:
            Text("Register")
        case .loading:
            withAnimation {
                LoaderView()
            }
        case .error(error: let errorString):
            withAnimation {
                ErrorView(error: errorString)
            }
        case .loaded:
            PrincipalView() // Home
        }
    }
}

#Preview {
    RootView()
        .environment(AppStateVM())
}
