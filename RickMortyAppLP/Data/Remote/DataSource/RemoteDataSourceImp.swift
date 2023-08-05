//
//  RemoteDataSourceImp.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import SwiftUI

// BackUp antes de las modificaciones del 5/8 y con lo anterior hecho en combine que modificque a asyncawait

 class RemoteDataSourceImp: RepositoryProtocol{
 private let serverApi: String = "https://rickandmortyapi.com"
 //AnyPublisher<CharactersNetworkResponse, Error>
     
 func getAllCharacters() async throws -> [CharactersNetworkResponseCharacter]{

 //URLSession.shared.dataTaskPublisher(for: URL(string:serverApi + "/api/character")!)
     
     var characterNetwork: [CharactersNetworkResponseCharacter] = []
     for num in 1...41{
         characterNetwork.append(contentsOf: try await getAllCharacterByPages(num: num).results)
     }
     return characterNetwork

 }
 
     func getAllCharacterByPages(num: Int) async throws -> CharactersNetworkResponse{
         let (data, _) = try await URLSession.shared.data(from: URL(string: serverApi + "/api/character/?page=\(num)")!)// le concateno el Path al server
         return try JSONDecoder().decode(CharactersNetworkResponse.self, from: data)
     }
     
     
 func loginApp() {
 
 }
 
 }
 
 
//*/



//import Combine


/*
///
class RemoteDataSourceImp: RepositoryProtocol{
   
    // 5/8 agrego Struct de erorespara devolver en la llamada a API
    
    enum WebServiceError: Error {
        case genericFailure
        case failedToDecodeData
        case invalidStatusCode
    }
    
    private let serverApi: String = "https://rickandmortyapi.com"
                                //AnyPublisher<CharactersNetworkResponse, Error>
    func getAllCharacters() async throws -> CharactersNetworkResponse? {

        // 5/8 agrego parametro response en la posicion de errores del llamado a la API
        let (data, response) = try await URLSession.shared.data(from: URL(string:serverApi + "/api/character")!) // concateno Path server
        guard let networkRequestResponse = response as? HTTPURLResponse,
              networkRequestResponse.statusCode == 200 else {
            throw WebServiceError.invalidStatusCode
        }
        return try JSONDecoder().decode(CharactersNetworkResponse.self, from: data)
    }



    func loginApp() {
        
    }
    
}

*/
