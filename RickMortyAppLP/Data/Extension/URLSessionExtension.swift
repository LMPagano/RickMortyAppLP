//
//  URLSessionExtension.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 8/8/23.
//

import Foundation

// Extension agregada para poder  modificar codigo y poder testear luego.

extension URLSession: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
    
}

