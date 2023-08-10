//
//  CharacterProviderProtocol.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 8/8/23.
//

import Foundation

protocol CharacterProviderProtocol{
    func provide()async -> [Character]
    func mapeo(characterNetworkResponse: [CharactersNetworkResponseResults])-> [Character]
}
