//
//  RemoteDataSourceProtocol.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import Foundation


protocol RemoteDataSourceProtocol{
    //MARK: - Funcion llamado API
    func getAllCharacters() async throws -> [CharactersNetworkResponseResults]
    func getAllCharacterByPages(_ : Int) async throws -> CharactersNetworkResponse
}
