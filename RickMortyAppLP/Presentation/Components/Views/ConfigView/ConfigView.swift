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
    @State var configViewModel: ConfigViewModel
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    
    var body: some View {
        VStack {
            
        //MARK: - Informacion
            Form {
                Section {
                    //MARK: - Contribucion
                    Link(destination: URL(string: "https://www.openbank.es/")!){
                        HStack {
                            Image(systemName: "banknote.fill")
                            Text("Contribuir")
                        }
                    }.accessibilityLabel("Contribuir")
                    .accessibilityHint("Acceder a cuenta bancaria ")
                    
                    //MARK: - Comentario / bug
                    Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScrXxgfxRRo2EKEu6Eyt9QDmZpXFUuvADNbHFGNbdbhG-cqVg/viewform?usp=sf_link")!) {
                        HStack {
                            Image(systemName: "pencil")
                            Text("Reportar Bug o dejanos un comentario")
                        }
                    }.accessibilityLabel("Reportar Bug o comentario")
                        .accessibilityHint("Acceder a formulario ")
                    
                    //MARK: - WhatsApp Message
                    Button {
                        configViewModel.openWhatsApp()
                    } label: {
                        HStack {
                            Image(systemName: "phone.bubble.left")
                            Text("Enviar WhatsApp")
                        }
                    }.accessibilityLabel("Enviar Wp")
                        .accessibilityHint("Acceder a wp para contactar desarrollador ")
                } header: {
                    Text("Contacto")
                }

                Section(header: Text("Información")) {
                    Link(destination: URL(string: "https://github.com/LMPagano")!) {
                        HStack {
                            Image(systemName: "person")
                            Text("Desarrollador -> git")
                        }
                    }
                }
                //:Fin comunicacion
                
                
                Section(header: Text("Apariencia"), footer: Text("Opciones de configuracion")) {
                    Toggle(isOn: $isDarkModeOn) {
                        Text("Dark Mode")
                    }
                }// DarkMode toggle
                .accessibilityLabel("Dark mode")
                    .accessibilityHint("Toogle para elegir modo oscuro ")
            }.accessibilityLabel("Grouping Container")
            VStack{
                NavigationStack(){
                    FooterConfigView()
                }.accessibilityLabel("Imagenes miniatura de todos los personajes")
            }.padding(0)
            .accessibilityLabel("Grouping Container")
        }.navigationTitle("Info y preferencias")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Recoveryview_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView(configViewModel: ConfigViewModel())
    }
}
