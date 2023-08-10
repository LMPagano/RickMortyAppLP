//
//  Characters.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 1/8/23.
//
import Foundation

 // MARK: - Estructura Json API

struct CharactersNetworkResponse : Codable{
    let info: CharactersNetworkResponseInfo
    let results: [CharactersNetworkResponseResults]
}

struct CharactersNetworkResponseInfo : Codable{
    let count:Int //826
    let pages:Int //42
    let next:String
    let prev:String?//": null
}

struct CharactersNetworkResponseResults: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: CharactersNetworkResponseCharacterLocation
    let image: String
    let url: String
    let created: String
}

struct CharactersNetworkResponseCharacterLocation: Codable {
    let name:String
    let url:String
}

