//
//  RemoteDataSourceImp.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import SwiftUI

 class RemoteDataSourceImp: RepositoryProtocol{
     //modificacion 8/8
     private let session: NetworkFetchingProtocol // agregado para tests, hay que modificarlo aca abajo en shared.data por session.data
     
     private let serverApi: String = "https://rickandmortyapi.com"
     
     //modificacion 8/8
     init(session: NetworkFetchingProtocol = URLSession.shared){
         self.session = session
     }// iniciado par poder utulizarloa bajo

     func getAllCharacters() async throws -> [CharactersNetworkResponseCharacter]{
         var characterNetwork: [CharactersNetworkResponseCharacter] = []
         for num in 1...2{ //1...41
         characterNetwork.append(contentsOf: try await getAllCharacterByPages(num: num).results)
         }
     return characterNetwork
     }
 
     
     //modificacion 8/8
     
//     func getAllCharacterByPages(num: Int) async throws -> CharactersNetworkResponse{
//         let (data, _) = try await session.data(url: URL(string: serverApi + "/api/character/?page=\(num)")!)
//         return try JSONDecoder().decode(CharactersNetworkResponse.self, from: data)
//     }
     
      //BackUp modificado 8/8
     
     func getAllCharacterByPages(num: Int) async throws -> CharactersNetworkResponse{
         let (data, _) = try await URLSession.shared.data(from: URL(string: serverApi + "/api/character/?page=\(num)")!)
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
