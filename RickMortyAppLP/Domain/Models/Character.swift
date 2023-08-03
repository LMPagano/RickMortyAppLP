//
//  Models.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//

import Foundation


struct Character: Identifiable, Codable{
    let id: Int
    let name: String
//    let status: String
    let species: String
//    let type: String
    let gender: String
//    let origin, location: CharactersNetworkResponseCharacterLocation
    let image: String
//    let episode: [String]
//    let url: String
//    let created: String
}

