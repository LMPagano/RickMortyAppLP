//
//  LoginView.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI
//import Combine

struct LoginView: View {
    
    //  7/8
//    @EnvironmentObject var vmm: RootViewModel
    
    
    //  6/8
    @StateObject var vm = LoginViewModel()
//    @EnvironmentObject var rootViewModel: RootViewModel
    
    
    var body: some View {
        
        ZStack{
            Image("fondoportal")
                .resizable()
                .ignoresSafeArea()
            //            Color.gray
            
            
            // MARK: - User, password login button
            
            // 6/8
            
            if vm.authenticated {
                NavigationStack(){
                    HomeView()
                }
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
                    .frame(width: 272, height: 112)
                    
                    
                    // MARK: - Login button
                    
                    // 7-8
                    
//                    Button {
//                        rootViewModel.authenticate(user: $vm.username, password: $vm.password)
//                    } label: {
//                        Text("Ingresar")
//                            .buttonStyle(.bordered)
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(.white)
//                            .background(Color(uiColor: UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)))
//                            .cornerRadius(9)
//                            .shadow(radius: 10, x: 20, y: 10)
                        
                        
                        
                       
                         Button("Ingresar",role: .cancel, action: vm.authenticate)
                         .buttonStyle(.bordered)
                         .font(.title3)
                         .fontWeight(.semibold)
                         .foregroundStyle(.white)
                         //                                .frame(width: 138, height: 40)
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
                                //                        .font(.title2)
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
        
        struct LoginView_Previews: PreviewProvider {
            static var previews: some View {
                LoginView()
            }
        }
    }

    
    
    
    
    /*
     import SwiftUI
     
     struct LoginView: View {
     
     
     @State private var user = ""
     @State private var password = ""
     
     
     var body: some View {
     
     ZStack{
     Image("fondoportal")
     .resizable()
     .ignoresSafeArea()
     //            Color.gray
     
     
     // MARK: - User, password login button
     
     
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
     
     Button{
     
     
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
     }.padding(10)
     
     Spacer()
     
     HStack{
     
     Image("meeseeks")
     .resizable().frame(width: 30, height: 60)
     Button {
     
     
     } label: {
     Text("Crear usuario")
     //                        .font(.title2)
     .fontWeight(.semibold)
     .foregroundStyle(.white)
     .padding(5)
     .background(Color.green)
     .cornerRadius(8.0)
     
     }.frame(width: 300, height: 40)
     
     
     
     }
     HStack{
     
     Image("memorymorty")
     .resizable()
     .frame(width: 40, height: 40)
     
     Button {
     
     } label: {
     Text("No recuerda usuario/contraseña")
     //                        .font(.title2)
     .fontWeight(.semibold)
     .foregroundStyle(.white)
     .padding(5)
     .background(Color.red)
     .cornerRadius(8.0)
     
     }.frame(width: 300, height: 40)
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
     
     */
    

