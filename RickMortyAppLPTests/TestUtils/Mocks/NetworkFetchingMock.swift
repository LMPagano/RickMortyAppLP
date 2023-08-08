//
//  NetworkFetchingMock.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 8/8/23.
//

import Foundation

@testable import RickMortyAppLP

class NetworkFetchingMock: NetworkFetchingProtocol {
    
    let result: Result<Data, Error>

    init(returning result: Result<Data, Error>) {
        self.result = result
    }
    
//    func load(fromRequest request: URLRequest) -> AnyPublisher<Data, Error> {
//        return result.publisher
//            .eraseToAnyPublisher()
//    }
//
    
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        // Not needed as it is done with the URLProtocol
        return ("".data(using: .utf8)!,URLResponse()) // Not needed
    }
}
