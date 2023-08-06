//
//  RemoteDataSourceImpTests.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 6/8/23.
//

import XCTest
@testable import RickMortyAppLP

final class RemoteDataSourceImpTests: XCTestCase {

    
//    override func setUpWithError() throws {
//        remoteDataSourceImp = RemoteDataSourceImp()
//
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//
//
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() async throws {
        
        let remoteDataSourceImp: RemoteDataSourceImp = RemoteDataSourceImp()
        let characters: [CharactersNetworkResponseCharacter] = try await remoteDataSourceImp.getAllCharacters()
        XCTAssertEqual(characters.count, 40)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
