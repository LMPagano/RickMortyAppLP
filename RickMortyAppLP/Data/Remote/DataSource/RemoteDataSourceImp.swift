//
//  RemoteDataSourceImp.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import SwiftUI

enum errorResponse: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

final class RemoteDataSourceImp: RepositoryProtocol{
    
    //modificacion 8/8
    // agregado para tests, hay que modificarlo aca abajo en shared.data por session.data
    private let session: NetworkFetchingProtocol
         init(session: NetworkFetchingProtocol = URLSession.shared){
             self.session = session
         }
    
    func getAllCharacterByPages(_ num: Int) async throws -> CharactersNetworkResponse{

        let serverApi = "https://rickandmortyapi.com"
        let pathPage = "/api/character/?page=\(num)"
        let concaApi = serverApi + pathPage
        guard (URL(string: concaApi) != nil) else{
            throw errorResponse.invalidURL
        }
        
        let finalUrl = URL(string: concaApi)
        let urlRequest = URLRequest(url: finalUrl!)
        
                                     // 8/8 URLSession.shared.data
        let (data, response) = try await session.data(url: urlRequest)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw errorResponse.invalidResponse
        //let (data, response) = try await URLSession.shared.data(from: URL(string: serverApi + "/api/character/?page=\(num)")!)
        }
        
        do{
            let arrayCharactersNetworkResponse = JSONDecoder()
            return try arrayCharactersNetworkResponse.decode(CharactersNetworkResponse.self, from: data)
        }
    }
    
    func getAllCharacters() async throws -> [CharactersNetworkResponseResults]{
        var characterNetwork: [CharactersNetworkResponseResults] = []
        for num in 1...2{ //1...41
            characterNetwork.append(contentsOf: try await getAllCharacterByPages(num).results)
        }
        return characterNetwork
    }
    
}
