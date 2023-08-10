//
//  RemoteDataSourceImpTests.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 6/8/23.
//

import XCTest
@testable import RickMortyAppLP

final class RemoteDataSourceImpTests: XCTestCase{
    var sut: RemoteDataSourceImp!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [URLProtocolMock.self]
        let mockedSession =  URLSession(configuration: sessionConfiguration)
       
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_getAllCharacter_ExpectedArrayOfCharacters() async throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response,"Hola".data(using: .utf8))
        }
        
        // Inyectamos la configuración nuestra al mock
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImp(session: mockURLSession)
        
        var didFailWithError = false
        
        do{
            try await sut.getAllCharacters()
        }catch{
           didFailWithError = true
        }
        XCTAssertTrue(didFailWithError, "Comprobacion de funcion")

    }
    
    func test_getAllCharacterByPages_ExpectedArrayOfCharactersRegardinFuncGetAllCharacters() async throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response,"{    \"info\": {        \"count\": 826,        \"pages\": 42,        \"next\": \"https://rickandmortyapi.com/api/character?page=2\",        \"prev\": null    },    \"results\": [{        \"id\": 1,        \"name\": \"Rick Sanchez\",        \"status\": \"Alive\",        \"species\": \"Human\",        \"type\": \"\",        \"gender\": \"Male\",        \"origin\": {            \"name\": \"Earth (C-137)\",            \"url\": \"https://rickandmortyapi.com/api/location/1\"        },        \"location\": {            \"name\": \"Citadel of Ricks\",            \"url\": \"https://rickandmortyapi.com/api/location/3\"        },        \"image\": \"https://rickandmortyapi.com/api/character/avatar/1.jpeg\",        \"episode\": [\"https://rickandmortyapi.com/api/episode/1\"],        \"url\": \"https://rickandmortyapi.com/api/character/1\",        \"created\": \"2017-11-04T18:48:46.250Z\"    }]}".data(using: .utf8))
        }
        
        // Inyectamos la configuración nuestra al mock
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = RemoteDataSourceImp(session: mockURLSession)
        
        var didFailWithError = false
        
        do{
            try await sut.getAllCharacterByPages(1)
        }catch{
           didFailWithError = true
        }
        XCTAssertFalse(didFailWithError, "Comprobacion de funcion getAllCharacterByPages")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


// BSck up 8/8

/*
 final class RemoteDataSourceImpTests: XCTestCase {

     var sut: RemoteDataSourceProtocol?
     
     override func setUpWithError() throws {
         try super.setUpWithError()
         

         // Put setup code here. This method is called before the invocation of each test method in the class.
     }

     override func tearDownWithError() throws {

         sut = nil
         try super.tearDownWithError()
         
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

     func testExample() async throws {
         //GIVEN
 //        let expectation
         
         
         //THEN
         
         
         //WHEN
         
         
         
         
         let remoteDataSourceImp: RemoteDataSourceImp = RemoteDataSourceImp()
         let characters: [CharactersNetworkResponseResults] = try await remoteDataSourceImp.getAllCharacters()
         XCTAssertEqual(characters.count, 40)
         
     }

     func testPerformanceExample() throws {
         // This is an example of a performance test case.
         self.measure {
             // Put the code you want to measure the time of here.
         }
     }

 }

 
 */
