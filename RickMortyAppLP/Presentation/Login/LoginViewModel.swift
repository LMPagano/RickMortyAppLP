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
//        // Keep filled ONLY for debugging
        @Published var password = "1234" // Keep filled ONLY for debugging
        @Published var invalid: Bool = false

        private var sampleUser = "username"
        private var samplePassword = "1234"
        
        init() {
            // Debugging
            print("Estado inicio de sesion: \(authenticated)")
            print("Usuario actual: \(username)")
        }
        
        func toggleAuthentication() {
            // Make sure that the password does not save.
            self.password = ""
            
            authenticated.toggle()
//            withAnimation(.spring()) {
//                authenticated.toggle()
//            }
        }

        @MainActor func authenticate() {
                // Check for user
                guard self.username.lowercased() == sampleUser else {
                    self.invalid = true
                    return }
                
                // Check for password
                guard self.password.lowercased() == samplePassword else {
                    self.invalid = true
                    return }
         
            toggleAuthentication()
        }
        
        func logOut()  {
            print("Se esta por togglear \(authenticated)")
        }

        func logPressed() {
            print("Boton presionado")
        }
    }

