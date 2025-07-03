//
//  HerosDetailView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import SwiftUI

struct HerosDetailView: View {
    var hero: HerosModel // Nos lo pasa el padre (HerosView)
    
    @Bindable
    var vmHeros: HerosViewModel // Referencia al viewmodel del padre
    
    var body: some View {
        // Heros name and favourite
        HStack {
            // Title
            Text(hero.name)
                .bold()
                .font(.title)
            
            Spacer()
            
            // Favourite button
            Button {
                // Action here
                Task {
                    await vmHeros.setLikeHero(idHero: hero.id.uuidString)
                }
                
                
            } label: {
                Image(systemName: "heart.fill")
                    .resizable()
                // único caso de desempaquetado forzado
                    .foregroundStyle(hero.favorite! ? .red : .gray)
                    .frame(width: 36, height: 32)
                    .padding(.trailing, 12)
                    
            }
        } // HStack
        .padding([.trailing, .leading], 10)
        
        // Photo
        AsyncImage(url: URL(string: hero.photo)) { photo in
            // It arrives here
            photo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding([.leading, .trailing], 20)
                .opacity(0.8)
        } placeholder: {
            Text("Cargando foto")
        }
        
        // Description
        Text(hero.description)
            .foregroundStyle(.black)
            .font(.title3)
            .padding([.trailing, .leading], 10)
    }
}

#Preview {
    HerosDetailView(hero: HerosModel(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300" , favorite: true), vmHeros: HerosViewModel(useCase: HerosUseCaseMock()))
}
