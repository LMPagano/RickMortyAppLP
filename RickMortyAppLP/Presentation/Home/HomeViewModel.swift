//
//  HomeViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import Foundation
//import Combine


@MainActor
class HomeViewModel: ObservableObject{
    
    @Published var charactersState: CharacterViewModelState
    @Published var arrayCharacters: [Character]
    
    let charactersProvider: CharactersProvider
    
    init() {
        self.charactersState = CharacterViewModelState.initial
        self.charactersProvider = CharactersProvider(charactersState: CharacterViewModelState.initial)
        self.arrayCharacters = []
    }
    
    func onLoad(){
        Task.init{arrayCharacters = await charactersProvider.provide()
            charactersState = CharacterViewModelState.loaded
                    }
    }
}



