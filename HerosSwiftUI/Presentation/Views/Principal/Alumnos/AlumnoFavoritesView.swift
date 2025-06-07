//
//  AlumnoFavoritesView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import SwiftUI

struct AlumnoFavoritesView: View {
    var data: AlumnosModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                // HerosList
                ForEach(data.heros) { hero in
                    Text(hero.name)
                }
                
                Divider()
                Spacer()
                
                // Close Button
                
                Button {
                    self.presentationMode.wrappedValue.dismiss() // Close modal
                } label: {
                    Text("Cerrar")
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.white)
                        .background(.orange)
                }
            }
        }
    }
}

#Preview {
    AlumnoFavoritesView(data: AlumnosModel(id: UUID().uuidString, email: "l@gmail.com", apell1: "EF", apell2: "FAFA", name: "Luis", photo: "https://statics.uniradioinforma.com/2023/05/64680f644935f.jpg", bootcamp: BootcampModel(id: "ZZ", name: "BOOT"), heros: [
        
        HerosModel(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300" , favorite: true),
        
        HerosModel(id: UUID(), name: "Vegeta", description: "Vegeta es todo lo contrario. Es arrogante, cruel y despreciable. Quiere conseguir las bolas de Dragón y se enfrenta a todos los protagonistas, matando a Yamcha, Ten Shin Han, Piccolo y Chaos. Es despreciable porque no duda en matar a Nappa, quien entonces era su compañero, como castigo por su fracaso. Tras el intenso entrenamiento de Goku, el guerrero se enfrenta a Vegeta y estuvo a punto de morir. Lejos de sobreponerse, Vegeta huye del planeta Tierra sin saber que pronto tendrá que unirse a los que considera sus enemigos.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300" , favorite: true)
    ]))
}
