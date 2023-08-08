//
//  RepositoryProtocol.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import Foundation
//import Combine


protocol RepositoryProtocol{
    // 5/8 agregue el condicional a CharactersNetworkResponse
    //MARK: - Funcion llamado api
    func getAllCharacters() async throws -> [CharactersNetworkResponseCharacter]
    func loginApp ()

}
