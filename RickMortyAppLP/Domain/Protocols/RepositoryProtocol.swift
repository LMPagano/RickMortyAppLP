//
//  RepositoryProtocol.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import Foundation
//import Combine


protocol RepositoryProtocol{
    //TODO: - ver comentario y funcionalidad Combine
    //Creo Protocolo con la funcion que trae info del repo y lo asigno por combine con el output:el objeto Characters y la Failure:  Error
    
    func loginApp ()

    
    // 5/8 agregue el condicional a CharactersNetworkResponse
    
                            //AnyPublisher<CharactersNetworkResponse, Error>
    func getAllCharacters() async throws -> [CharactersNetworkResponseCharacter]
}
