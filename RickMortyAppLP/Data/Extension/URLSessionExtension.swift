//
//  URLSessionExtension.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 8/8/23.
//

import Foundation

// copiado para poder Hacer test del RemoteDataSourceProtocol

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
    
}

