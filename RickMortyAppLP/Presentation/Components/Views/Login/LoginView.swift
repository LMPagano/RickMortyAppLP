//
//  LoginView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI

struct LoginView: View {

    //  6/8
    @StateObject var vm = LoginViewModel()

    var body: some View {
            ZStack{
                Image("fondoportal")
                    .resizable()
                    .ignoresSafeArea()

                // MARK: - User, password login button
                if vm.authenticated {
                    NavigationStack(){
                        HomeView() }
                    }else{
                    VStack {
                        Image("logoRM2")
                            .resizable()
                            .frame(width: 350, height: 120)
                            .padding()
                        //                    .frame(width: 380, height: 200) //tamaño "logoRM"
                        Image("rymlogoinicio")
                            .resizable()
                            .frame(width: 200, height: 180)
                            .shadow(radius: 10, x: 20, y: 10)
                        
                        
                        // MARK: - User, password
                        VStack {
                            TextField("User email", text: $vm.username)
                                .padding(10)
                                .background(.white)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .textInputAutocapitalization(.never)
                            
                            Spacer()
                            
                            SecureField("Contraseña", text: $vm.password)
                                .padding(10)
                                .background(.white)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .textInputAutocapitalization(.never)
                                .privacySensitive()
                            
                        }
                        .frame(width: 150, height: 100)

                        // MARK: - Login button
                        Button("Ingresar",role: .cancel, action: vm.authenticate)
                            .buttonStyle(.bordered)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .background(Color(uiColor: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)))
                            .cornerRadius(9)
                            .shadow(radius: 10, x: 20, y: 10)
                        Spacer()
                        HStack{
                            Image("memorymorty")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Button {

                            } label: {
                                Text("No recuerda usuario/contraseña")

                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding(5)
                                    .background(Color.red)
                                    .cornerRadius(8.0)
                                
                            }.frame(width: 300, height: 40)
                        }
                    }.alert("Error contraseña/password", isPresented: $vm.invalid) {
                        Button("Volver", action: vm.logPressed)
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
