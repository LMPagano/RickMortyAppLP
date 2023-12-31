//
//  CharactersProvider.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//
import Foundation
 
final class CharactersProvider: CharacterProviderProtocol{
    
    let remoteDataSourceImp: RemoteDataSourceProtocol
    var charactersState: CharacterViewModelState
     
    init(charactersState: CharacterViewModelState, remoteDatasourceImp: RemoteDataSourceProtocol = RemoteDataSourceImp()) {
         self.charactersState = charactersState
         self.remoteDataSourceImp = remoteDatasourceImp
     }
     
     func provide() async -> [Character]{
        let characterNetworkResponse: [CharactersNetworkResponseResults] = try! await remoteDataSourceImp.getAllCharacters()
        return mapeo(characterNetworkResponse: characterNetworkResponse)
     }
                                             
     func mapeo(characterNetworkResponse: [CharactersNetworkResponseResults]) -> [Character]{
         print("Mapeo de API a local")
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
