//
//  AlumnosRowView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 03/06/25.
//

import SwiftUI

struct AlumnosRowView: View {
    var data: AlumnosModel
    
    var body: some View {
        // Photo, is optional
        VStack {
            if let photo = data.photo {
                // Theres photo
                AsyncImage(url: URL(string: photo)) { Image in
                    //Downloaded image
                    Image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    // What happens if theres a bug in the photo, what are we going to show instead
                } placeholder: {
                    //place holder
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }

            } else {
                // Theres no photo
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            
            // Name
            Text("\(data.name)")
                .font(.caption)
                .foregroundStyle(.orange)
            
        } // VStack
        .onAppear {
            // log de ui
            print("Cargando \(data.email)")
        }
    }
}

#Preview {
    AlumnosRowView(data: AlumnosModel(id: UUID().uuidString, email: "email", apell1: "Quintero", apell2: "Ramirez", name: "Luis", photo: "https://statics.uniradioinforma.com/2023/05/64680f644935f.jpg", bootcamp: BootcampModel(id: "sss", name: "Prueba bootcamp"), heros: []))
}
