//
//  HomeViewModel.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import Foundation
import Combine

// Creo la clase

class HomeViewModel: ObservableObject{
    
    @Published var charactersState: CharacterViewModelState = CharacterViewModelState.initial
    
    let remoteDataSourceImp: RepositoryDataSourceProtocol = RepositoryDataSourceProtocol()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getAllCharacters()
    }
    
    func getAllCharacters(){
        charactersState = CharacterViewModelState.loading
        
        remoteDataSourceImp.getAllCharacters()
            .sink{ [weak self] completion in
                switch completion{
                case .finished:
                    print("Finish")
                case .failure(let error):
                    self?.charactersState = CharacterViewModelState.error(errorMessage: "\(error)")
                }
            }receiveValue: {
                [weak self] Characters in
                self?.charactersState = CharacterViewModelState.loaded(dataCharacter: Characters)
            }
            .store(in: &cancellable)
    }
}



