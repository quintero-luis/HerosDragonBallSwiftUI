//
//  HerosView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 02/06/25.
//

import SwiftUI

struct HerosView: View {
    @Environment(AppStateVM.self) var appState
    @State var viewModel: HerosViewModel
    
    // Transition to HerosDetail
    @Namespace
    private var nameSpace
    
    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            // Heros list
            List {
                ForEach(viewModel.herosData) { hero in
                    NavigationLink {
                        // Destination
                        HerosDetailView(hero: hero, vmHeros: viewModel)
                        // Transition
                            .navigationTransition(.zoom(sourceID: hero.id, in: nameSpace))
                    } label: {
                        // Hero Row
                        HeroesRowView(hero: hero)
                    }

                }
            } // List
            .navigationTitle("Heroes")
            .searchable(text: $viewModel.filterUI, prompt: "Buscar heroes por nombre")
            .onChange(of: viewModel.filterUI) { oldValue, newValue in
                if !newValue.isEmpty {
                    // Is not empty
                    if newValue.count > 2 {
                        Task {
                            await viewModel.getHeros(newSearch: newValue)
                        }  
                    }
                    
                } else {
                    // Filter is empty, we load all
                    Task {
                        await viewModel.getHeros(newSearch: "")
                    }
                }
            }
            // Botón cerrar sesión
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Action Here
                        appState.closeSessionUser()
                    } label: {
                        Label("Cerrar", systemImage: "xmark.circle")
                            .padding()
                    }
                }
            }
        } // NavigationStack
    }
}

#Preview {
    HerosView(viewModel: HerosViewModel(useCase: HerosUseCaseMock()))
        .environment(AppStateVM())
}
