//
//  NetworkFetchingProtocol.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 8/8/23.
//

import Foundation

protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse)
}
