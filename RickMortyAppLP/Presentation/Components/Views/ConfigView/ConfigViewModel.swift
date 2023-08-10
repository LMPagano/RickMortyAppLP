//
//  ConfigViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 9/8/23.
//

import SwiftUI

class ConfigViewModel{
    
    func openWhatsApp(){
        let whatsappUrl = URL(string: "https://api.whatsapp.com/send?phone=4432282860&text=Hola")!
        if UIApplication.shared.canOpenURL(whatsappUrl) {
            UIApplication.shared.open(whatsappUrl)
        } else {
            print("No tiene la app WhatsApp instalada ")
        }
    }
}

