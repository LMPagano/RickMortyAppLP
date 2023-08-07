//
//  HomeViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import Foundation
import SwiftUI


@MainActor
class HomeViewModel: ObservableObject{
    
    @Published var charactersState: CharacterViewModelState
    var arrayCharacters: [Character]
    @Published var searchText = ""
    @Published var filteredCharacters: [Character]

    @Published var log = false
    
    
    let charactersProvider: CharactersProvider
    
    init() {
        self.charactersState = CharacterViewModelState.initial
        self.charactersProvider = CharactersProvider(charactersState: CharacterViewModelState.initial)
        self.arrayCharacters = []
        self.filteredCharacters = []
    }
    
    func onLoad(){
        Task.init{arrayCharacters = await charactersProvider.provide()
            filteredCharacters = arrayCharacters
            charactersState = CharacterViewModelState.loaded
                    }
    }
    
    func searchCharacter(textoABuscar: String){
        if textoABuscar == ""{
            filteredCharacters = arrayCharacters
        }else{
            filteredCharacters = arrayCharacters.filter{character in
                character.name.contains(textoABuscar)
            }
        }
        
    }
    
    
    func logOut(){
        
        
    }
    
    
}



