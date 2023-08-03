//
//  HomeViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    @Published var charactersState: CharacterViewModelState
    @Published var arrayCharacters: [Character]
    
    let charactersProvider: CharactersProvider
    
    init() {
        self.charactersState = CharacterViewModelState.initial
        self.charactersProvider = CharactersProvider(charactersState: CharacterViewModelState.initial)
        self.arrayCharacters = charactersProvider.provide()
    }
}



