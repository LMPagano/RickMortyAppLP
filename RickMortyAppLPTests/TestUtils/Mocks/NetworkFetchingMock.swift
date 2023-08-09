//
//  NetworkFetchingMock.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 8/8/23.
//

import Foundation

@testable import RickMortyAppLP

class NetworkFetchingMock: NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        // Not needed as it is done with the URLProtocol
        return ("Hola".data(using: .utf8)!,URLResponse()) // Not needed
    }
}
