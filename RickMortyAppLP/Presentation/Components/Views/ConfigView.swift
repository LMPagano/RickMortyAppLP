//
//  Recoveryview.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 6/8/23.
//

import SwiftUI

struct ConfigView: View {
        
    @StateObject private var loginViewModel = LoginViewModel()
  
    var body: some View {

        VStack {
        
            List(0..<2, id: \.self) { index in
                Text("#\(index)")}
            
            
            Button("LogOut"){
                loginViewModel.logOut()
            print("Logout button pressed")
            }
            
            
            
        }.navigationTitle("Wiki Rick y Morty Configuracion")
            .navigationBarTitleDisplayMode(.inline)
      
    }
}

struct Recoveryview_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
