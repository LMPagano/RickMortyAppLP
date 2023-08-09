//
//  LoginViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 6/8/23.
//

import SwiftUI

    class LoginViewModel: ObservableObject {
        
//        @AppStorage("AUTH_KEY") var authenticated = false {
//            willSet { objectWillChange.send() }
//        }
//        @AppStorage("USER_KEY") var username = ""
        var authenticated = false
        var username = "username"

        @Published var password = "1234"
        @Published var invalid: Bool = false

        private var sampleUser = "username"
        private var samplePassword = "1234"
        
        init() {
            // Debugging
            print("Estado inicio de sesion: \(authenticated)")
            print("Usuario actual: \(username)")
        }
        
        func toggleAuthentication() {
            self.password = ""
            authenticated.toggle()
        }

        @MainActor func authenticate() {
                guard self.username.lowercased() == sampleUser else {
                    self.invalid = true
                    return }
                
                guard self.password.lowercased() == samplePassword else {
                    self.invalid = true
                    return }
            
            toggleAuthentication()
        }
        
//        func logOut()  {
//            print("Se esta por togglear \(authenticated)")
//        }
//
        
        func logPressed() {
            print("Boton presionado")
        }
    }

