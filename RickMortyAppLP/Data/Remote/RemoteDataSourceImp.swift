//
//  RemoteDataSourceImp.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import Foundation
import Combine

class RepositoryDataSourceProtocol: RepositoryProtocol{
    private let server: String = "https://rickandmortyapi.com/api/character"
    
    func getAllCharacters() -> AnyPublisher<Characters, Error> {
            URLSession.shared.dataTaskPublisher(for: URL(string:server)!)
            .map({$0.data})
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func loginApp() {
        
    }
    
}
