//
//  CharactersProvider.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//

import Foundation
 
class CharactersProvider: CharacterProviderProtocol{
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
                       image: networkCharacter.image,
                          origin: networkCharacter.origin.name,
                          location: networkCharacter.location.name,
                          status: networkCharacter.status,
                          type: networkCharacter.type)
         }
     }
 }
