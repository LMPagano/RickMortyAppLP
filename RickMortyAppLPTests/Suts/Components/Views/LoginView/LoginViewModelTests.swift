//
//  LoginViewModelTests.swift
//  RickMortyAppLPTests
//
//  Created by Pagano Leandro Manuel on 10/8/23.
//

import XCTest

@testable import RickMortyAppLP

final class LoginViewModelTests: XCTestCase {
    var lognViewModel: LoginViewModel = LoginViewModel()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
    }

    func test_authenticateTest() throws {
        lognViewModel.authenticate()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
