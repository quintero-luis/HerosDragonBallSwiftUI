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
    
    @State private var animationAmount = 1.0
    
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
                    .padding(.top, 180) /// Put down Título

                
                // MARK: Usuario y clave
                VStack {
                    // Usuario
                    TextField("Email", text: $email)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.headline)
                        .textInputAutocapitalization(.never) /// Desactivate caps
                        .autocorrectionDisabled(true) ///Desactivate autocorrection
                        .opacity(0.8)
                        .id(1) // For testing
                    
                    // Clave
                    SecureField("Clave", text: $password)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.headline)
                        .textInputAutocapitalization(.never) /// Desactivate caps
                        .autocorrectionDisabled(true) ///Desactivate autocorrection
                        .padding(.top, 20)
                        .opacity(0.8)
                        .id(2) // For testing
                        
                    
                }
                .padding([.leading, .trailing], 30)
                .padding(.top, 256)
                
                // Login Button
                Button {
                    // TODO: Action Login
                } label: {
                    Text("Entrar")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: UIColor(red: 221.0/255.0, green: 99.0/255.0, blue: 0.00, alpha: 1.0)))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    // Shadow
                        .shadow(color: .orange, radius: 10.0, x: 8, y:8)
                }
                .padding(.top, 44)
                .opacity(0.8)
                .id(3)
                .overlay( // Animation
                    Circle()
                        .stroke(.white)
                        .scaleEffect(animationAmount)
                        .opacity(2-animationAmount)
                        .padding(.top, 50)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
                )
                .onAppear {
                    animationAmount = 2
                }
                
                Spacer()
                
                // Register Button
                HStack {
                    Text("¿No tienes cuenta?")
                        
                        .foregroundStyle(.white)
                        .bold()
                    Button {
                        // TODO: Make register Button Action
                    } label: {
                        Text("Registro")
                            .foregroundStyle(.cyan)
                            .bold()
                    }
                } // HStack
                .padding(.bottom, 44)
                
            }// VStack
        } // ZStack
        .ignoresSafeArea() /// To fill the whole screen, not only until safe area
    }
}

#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "en"))
        .preferredColorScheme(.light)
}
