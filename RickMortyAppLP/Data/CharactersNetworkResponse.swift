//
//  Characters.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//

import Foundation

 // TODO: - Cleanear esto

enum CharacterViewModelState{
    case initial
    case loading
    case loaded(dataCharacter: CharactersNetworkResponse)
    case error(errorMessage: String)
}

struct CharactersNetworkResponse : Codable{
    let info: CharactersNetworkResponseInfo
    let results: [CharactersNetworkResponseCharacter]
}

struct CharactersNetworkResponseInfo : Codable{
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String
    let prev:String?//": null
}

struct CharactersNetworkResponseCharacter: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: CharactersNetworkResponseCharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct CharactersNetworkResponseCharacterLocation: Codable {
    let name:String//": "Citadel of Ricks"
    let url:String
}

