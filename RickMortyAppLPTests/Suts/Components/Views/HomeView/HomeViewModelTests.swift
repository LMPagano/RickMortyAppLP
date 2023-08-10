//
//  HomeViewModelTests.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 10/8/23.
//

import XCTest
@testable import RickMortyAppLP

final class HomeViewModelTests: XCTestCase {
    
    //MARK: - sut
    var sut: HomeViewModel
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
      
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.setUpWithError()
    }

    func testExample() throws {

        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
