//
//  CharacterPoviderMock.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 10/8/23.
//

import Foundation
@testable import RickMortyAppLP

class CharacterProviderMock:CharacterProviderProtocol{
    
    func provide() async -> [RickMortyAppLP.Character] {
        return self.mapeo(characterNetworkResponse: [])
    }
    
    func mapeo(characterNetworkResponse: [RickMortyAppLP.CharactersNetworkResponseResults]) -> [RickMortyAppLP.Character] {
        return []
    }
}
