//
//  FavoritesHerosRowView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import SwiftUI

struct FavoritesHerosRowView: View {
    let hero: HerosModel
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: hero.photo)) { Image in
                Image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            //name
            
            Text(hero.name)
                .font(.title)
                .padding()

                
        }
        .padding()
    }
}

#Preview {
    FavoritesHerosRowView(hero:  HerosModel(id: UUID(), name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300" , favorite: true) )
}
