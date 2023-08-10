////
////  PlanetProvider.swift
////  RickMortyAppLP
////
////  Created by Pagano Leandro Manuel on 10/8/23.
////
//
//import Foundation
//
//
//final class PlanetProvider: PlanetRepoProtocol{
//    
//    private let remotePlanetDataSource: PlanetRepoProtocolData
//    
//    init(remotePlanetDataSource: PlanetRepoProtocolData){
//        self.remotePlanetDataSource = remotePlanetDataSource
//    }
//    
//    func loadData(query: String, completion: @escaping ([Planet]) -> ()) {
//        remotePlanetDataSource.loadData(query: query, completion: completion)
//    }
//}
