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

final class RemoteDataSourceImp: RemoteDataSourceProtocol{
    
    //implementacion NetworkFeetchinProtocol para poder mockear el test
    private let session: NetworkFetchingProtocol
         init(session: NetworkFetchingProtocol = URLSession.shared){
             self.session = session
         }
    
    // MARK: - Funcion llamado API
    func getAllCharacterByPages(_ num: Int) async throws -> CharactersNetworkResponse{
        let serverApi = "https://rickandmortyapi.com"
        let pathPage = "/api/character/?page=\(num)"
        let concaApi = serverApi + pathPage
        guard (URL(string: concaApi) != nil) else{
            throw errorResponse.invalidURL
        }
        
        let finalUrl = URL(string: concaApi)
        let urlRequest = URLRequest(url: finalUrl!)
        
                                     // 8/8 cambio URLSession.shared.data
        let (data, response) = try await session.data(url: urlRequest)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw errorResponse.invalidResponse
        }
        
        do{
            let arrayCharactersNetworkResponse = JSONDecoder()
            return try arrayCharactersNetworkResponse.decode(CharactersNetworkResponse.self, from: data)
        }
    }
    
    //MARK: - Funcion para traer informacion de la API por pagina
    func getAllCharacters() async throws -> [CharactersNetworkResponseResults]{
        var characterNetwork: [CharactersNetworkResponseResults] = []
        for num in 1...10{ //1...41-> Total de paginas
            characterNetwork.append(contentsOf: try await getAllCharacterByPages(num).results)
        }
        return characterNetwork
    }
}
