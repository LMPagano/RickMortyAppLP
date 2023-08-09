//
//  HomeViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import Foundation
import SwiftUI

enum CharacterViewModelState{
    case initial
    case loading
    case loaded
    case error
}

@MainActor
class HomeViewModel: ObservableObject{
    
    @Published var charactersState: CharacterViewModelState
    var arrayCharacters: [Character]
    @Published var searchText = ""
    @Published var filteredCharacters: [Character]
    
    let charactersProvider: CharactersProvider
    
    init(characterProvider: CharactersProvider = CharactersProvider(charactersState: CharacterViewModelState.initial)) {
        self.charactersState = CharacterViewModelState.initial
        self.charactersProvider = characterProvider
        self.arrayCharacters = []
        self.filteredCharacters = []
    }
    
    func onLoad(){
        Task{arrayCharacters = await charactersProvider.provide()
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
    
    func showQOfCharacters()-> String?{
        var textViewCharacters = "Cantidad: \(filteredCharacters.count)"
        
        if filteredCharacters.count != arrayCharacters.count{
            return textViewCharacters
        }else{
            return nil
        }
    }
    
}




