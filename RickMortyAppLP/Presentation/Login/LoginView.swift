//
//  LoginView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var user = ""
    @State private var password = ""
    
    
    
    var body: some View {
        
        ZStack{
            Color.gray
            .ignoresSafeArea()
            
            // MARK: - User, password login button
            VStack {
                Image("")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                // MARK: - User, password
                VStack {
                    TextField("User email", text: $user)
                        .padding(10)
                        .background(.white)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    
                    Spacer()
                        
                    SecureField("Contraseña", text: $password)
                        .padding(10)
                        .background(.white)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    
                }
                .frame(width: 272, height: 112)
                
    
                
                // MARK: - Login button
                Button {
                    
                    
//                    rootViewModel.onLogin(user: "bejl@keepcoding.es", password: "123456")
                } label: {
                    Text("Ingresar")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 138, height: 40)
                        .background(Color(uiColor: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)))
                        .cornerRadius(8.0)
                        .shadow(radius: 10, x: 20, y: 10)
                }
                
                Spacer()
                
                Button {

                } label: {
                    Text("No recuerda usuario/contraseña")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(25)
                        .frame(width: .infinity, height: 40)
                        .background(Color.red)
                        .cornerRadius(5.0)
                        .shadow(radius: 10, x: 20, y: 10)
                }
            }
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
