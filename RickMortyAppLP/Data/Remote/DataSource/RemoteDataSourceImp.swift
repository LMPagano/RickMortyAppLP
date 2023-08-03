//
//  RemoteDataSourceImp.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import Foundation
import Combine

class RepositoryDataSourceProtocol: RepositoryProtocol{
    private let serverApi: String = "https://rickandmortyapi.com"
    
    func getAllCharacters() -> AnyPublisher<CharactersNetworkResponse, Error> {
            URLSession.shared.dataTaskPublisher(for: URL(string:serverApi + "/api/character")!) // le concateno el Path al server
            .map({$0.data})
            .decode(type: CharactersNetworkResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func loginApp() {
        
    }
    
}
