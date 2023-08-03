//
//  RepositoryProtocol.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 2/8/23.
//

import Foundation
import Combine


protocol RepositoryProtocol{
    //TODO: - ver comentario y funcionalidad Combine
    //Creo Protocolo con la funcion que trae info del repo y lo asigno por combine con el output:el objeto Characters y la Failure:  Error
    
    func loginApp ()
    func getAllCharacters() -> AnyPublisher<CharactersNetworkResponse, Error>
}
