//
//  HomeViewModelTests.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 10/8/23.
//

import XCTest
@testable import RickMortyAppLP

final class HomeViewModelTests: XCTestCase {
    
    
    override func setUpWithError() throws {
  
    }

    override func tearDownWithError() throws {
      
    }

    @MainActor func testExample() throws {
    var homeViewModel: HomeViewModel = HomeViewModel(characterProvider: CharacterProviderMock())
        
        homeViewModel.onLoad()
        XCTAssertEqual(0, homeViewModel.arrayCharacters.count)
        
    }
    
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
