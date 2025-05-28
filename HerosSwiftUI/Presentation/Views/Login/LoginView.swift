//
//  LoginView.swift
//  HerosSwiftUI
//
//  Created by Luis Quintero on 28/05/25.
//

import SwiftUI

struct LoginView: View {
    
#if DEBUG
    @State private var email = "luisgq1975@gmail.com"
    @State  private var password = "abcdef"
#else
    @State private var email = ""
    @State  private var password = ""
#endif
    var body: some View {
        ZStack {
            // Imagen de fondo
            Image(.backgroundLogin)
                .resizable() /// Solo para resize en safearea
            // Imagen negra
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.5)
            
            // Componentes del login
            VStack {
                Image(.title) /// Dragon Ball Title
                    .resizable()
                    .scaledToFit()
                    .opacity(0.7)
                    .padding(.top, 180) /// Bajar Título

                
                // MARK: Usuario y clave
                VStack {
                    // Usuario
                    TextField("Email", text: $email)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.headline)
                        .textInputAutocapitalization(.never) /// Desactivar mayuscula
                        .autocorrectionDisabled(true) ///Desactivar autocorreción
                        .opacity(0.8)
                        .id(1) // For testing
                    
                    // Clave
                    SecureField("Clave", text: $password)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.headline)
                        .textInputAutocapitalization(.never) /// Desactivar mayuscula
                        .autocorrectionDisabled(true) ///Desactivar autocorreción
                        .padding(.top, 20)
                        .opacity(0.8)
                        .id(1) // For testing
                        
                    
                }
                .padding([.leading, .trailing], 30)
                Spacer()
                
            }// VStack
        } // ZStack
        .ignoresSafeArea() /// Para que llene toda la pantalla
    }
}

#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "es"))
        .preferredColorScheme(.light)
}
