//
//  RickMortyAppLPApp.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import SwiftUI

@main

struct RickMortyAppLPApp: App {
    //MARK:- Asginacion variable configuracion local por DarkMode
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    
    var body: some Scene {
        WindowGroup {
            LoginView().preferredColorScheme(isDarkModeOn ? .dark : .light)
            //HomeView(busqueda: "")
        }
    }
}
