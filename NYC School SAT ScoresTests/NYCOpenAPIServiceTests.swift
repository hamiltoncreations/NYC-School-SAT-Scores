//
//  NYCOpenAPIServiceTests.swift
//  NYC School SAT SCoresTests
//
//  Created by Matthew Hamilton on 6/20/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import XCTest
@testable import NYC_School_SAT_SCores

/// Integration tests for the NYCOpenAPIService
///
/// - Note: With additional time, NYCOpenAPIService could be modified to allow
///    overriding of the default SessionManager. This would allowed us to
///    remove the 'requirement' of executing AlamoFireWrapper code and
///    run these tests without real network calls
class NYCOpenAPIServiceTests: XCTestCase {

    var nycOpenAPIService = NYCOpenAPIService()
    
    func testGetSchools () {
        // Arrange
        let apiExpectation = self.expectation(description: "testGetSchools call")
        var schools: [SchoolInfo]?
        
        // Act
        nycOpenAPIService.getSchools() { result in
        
            schools = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        guard let schoolList = schools else {
            XCTFail("School List is nil")
            return
        }
        
        // Assert
        XCTAssertGreaterThan(schoolList.count, 0)
    }

    func testGetSATScoresWithValidDBN () {
        // Arrange
        let apiExpectation = self.expectation(description: "testGetSATScoresWithValidDBN call")
        var satScore: SATData?
        
        // Act
        nycOpenAPIService.getSATScores(dbn: "21K728") { result in
            satScore = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert
        XCTAssertNotNil(satScore)
    }
    
    func testGetSATScoresWithInvalidDBN () {
        // Arrange
        let apiExpectation = self.expectation(description: "testGetSATScoresWithInvalidDBN call")
        var satScore: SATData?
        
        // Act
        nycOpenAPIService.getSATScores(dbn: "BADVALUE") { result in
            satScore = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert
        XCTAssertNil(satScore)
    }
}
