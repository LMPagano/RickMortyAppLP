//
//  Recoveryview.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 6/8/23.
//

import SwiftUI
import MessageUI

struct ConfigView: View {
        
    @StateObject private var loginViewModel = LoginViewModel()
    
    // 9/8
    @State var showFavorites = false
    @State var configViewModel: ConfigViewModel
    
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    
    var body: some View {
        VStack {
            
        //MARK: - Informacion
            
            Form {
                Section {
                    //Contribucion
                    Button {
                     
                    } label: {
                        HStack {
                            Image(systemName: "banknote.fill")
                            Text("Contribuir")
                        }
                    }
                    
                    ///Comentario / bug
                    Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScrXxgfxRRo2EKEu6Eyt9QDmZpXFUuvADNbHFGNbdbhG-cqVg/viewform?usp=sf_link")!) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Reportar Bug o dejanos un comentario")
                        }
                    }
                    
                    ///WhatsApp Message
                    Button {
                        configViewModel.openWhatsApp()
                    } label: {
                        HStack {
                            Image(systemName: "phone.bubble.left")
                            Text("Enviar WhatsApp")
                        }
                    }
                } header: {
                    Text("Contacto")
                }

                
                Section(header: Text("Información")) {
                    Link(destination: URL(string: "https://github.com/LMPagano")!) {
                        HStack {
                            Image(systemName: "person")
                            Text("Desarrollador")
                        }
                    }
                }//End of comunications section
                
                
                Section(header: Text("Apariencia"), footer: Text("Opciones de configuracion")) {
                    Toggle(isOn: $isDarkModeOn) {
                        Text("Dark Mode")
                    }
                }
                
            }//: DarkMode toggle
                    Toggle(isOn: $showFavorites){
                        Text("Mostrar Favoritos")
                    }
        
            
//            Button("LogOut"){
//                loginViewModel.logOut()
//            print("Logout button pressed")
//            }
        }.navigationTitle("Info y preferencias")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Recoveryview_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView(showFavorites: false, configViewModel: ConfigViewModel())
    }
}
