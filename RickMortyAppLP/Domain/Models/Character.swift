//
//  Models.swift
//  RickMortyAppLP
//
//  Created by Pagano Leandro Manuel on 3/8/23.
//
import Foundation

struct Character: Identifiable, Codable, Hashable{
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    let origin: String
    let location: String
    let status: String
    let type: String
    
    //9/8
    var favorite: Bool?
}


