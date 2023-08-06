//
//  CharactersProvider.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//

import Foundation
 
 class CharactersProvider{
     
     let remoteDataSourceImp: RemoteDataSourceImp // = RepositoryDataSourceProtocol()
     var charactersState: CharacterViewModelState
     
     init(charactersState: CharacterViewModelState) {
         self.charactersState = charactersState
         self.remoteDataSourceImp = RemoteDataSourceImp()
     }
     
     func provide() async -> [Character]{
         let characterNetworkResponse: [CharactersNetworkResponseCharacter] = try! await remoteDataSourceImp.getAllCharacters()
             return mapeo(characterNetworkResponse: characterNetworkResponse)

     }
                                             
     func mapeo(characterNetworkResponse: [CharactersNetworkResponseCharacter]) -> [Character]{

         print("Mapeo remote to local")
         return characterNetworkResponse.map{networkCharacter in
             Character(id: networkCharacter.id,
                       name: networkCharacter.name,
                       species: networkCharacter.species,
                       gender: networkCharacter.gender,
                       image: networkCharacter.image)
         }
         
     }

 }






/*

class CharactersProvider{
    let remoteDataSourceImp: RemoteDataSourceImp // = RepositoryDataSourceProtocol()
    var charactersState: CharacterViewModelState
    
    init(charactersState: CharacterViewModelState) {
        self.charactersState = charactersState
        self.remoteDataSourceImp = RemoteDataSourceImp()
    }
    
    func provide() async -> [Character]{
        
//        do{
        let characterNetworkResponse: CharactersNetworkResponse = try! await remoteDataSourceImp.getAllCharacters()
            return mapeo(characterNetworkResponse: characterNetworkResponse)
//        }catch{
//
//
//        }
    }
                                            
    func mapeo(characterNetworkResponse: CharactersNetworkResponse?) -> [Character]{
        guard characterNetworkResponse != nil else{
            print("Error funcion mapeo")
            return []
        }
        print("Paseo el mapeo")
        return characterNetworkResponse!.results.map{networkCharacter in
            Character(id: networkCharacter.id,
                      name: networkCharacter.name,
                      species: networkCharacter.species,
                      gender: networkCharacter.gender,
                      image: networkCharacter.image)
        }
        
    }

}

*/

///*
///
///



/*
 
 
 //import Combine
class CharactersProvider{
    
    let remoteDataSourceImp: RepositoryDataSourceProtocol // = RepositoryDataSourceProtocol()
    var charactersState: CharacterViewModelState
    var cancellable = Set<AnyCancellable>()
    
    init(charactersState: CharacterViewModelState) {
        self.charactersState = charactersState
        self.remoteDataSourceImp = RepositoryDataSourceProtocol()
    }
    
    func provide() -> [Character]{
        var characterNetworkResponse: CharactersNetworkResponse?
        remoteDataSourceImp.getAllCharacters()
            .sink{ [weak self] completion in
                switch completion{
                case .finished:
                    print("Finish del .sink provide()")
                case .failure(let error):
                    print("Error VM")
                    self?.charactersState = CharacterViewModelState.error(errorMessage: "\(error)")
                }
            }receiveValue: {
                [weak self] values in
                print("estos son los valores recibidos de red por combine \(values)")
                self?.charactersState = CharacterViewModelState.loaded(dataCharacter: values)
                characterNetworkResponse = values
                
            }.store(in: &cancellable)
        
        return mapeo(characterNetworkResponse: characterNetworkResponse)
    }
                                            
    func mapeo(characterNetworkResponse: CharactersNetworkResponse?) -> [Character]{
        guard characterNetworkResponse != nil else{
            print("Error funcion mapeo")
            return []
        }
        return characterNetworkResponse!.results.map{ networkCharacter in
            Character(id: networkCharacter.id,
                      name: networkCharacter.name,
                      species: networkCharacter.species,
                      gender: networkCharacter.gender,
                      image: networkCharacter.image)
        }
    }
}

 */

