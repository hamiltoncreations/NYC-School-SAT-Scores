//
//  AlamoFireWrapperTets.swift
//  NYC School SAT SCoresTests
//
//  Created by Matthew Hamilton on 6/19/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import XCTest
@testable import NYC_School_SAT_SCores

class AlamoFireWrapperTests: XCTestCase {

    /// Technically integration tests as these are real network calls
    ///   I've used an online tool to make a quick API for verifying functionality
    let alamoFireWrapper = AlamoFireWrapper()
    let apiURL = "https://mhamnyc.free.beeceptor.com"
    let simpleEndpoint = "/simple"
    let fakeEndpoint = "/doesnotexist"
    let emptyHeaders = Dictionary<String,String>()
    
    struct SampleAPIValue: Codable {
        let sample: String
    }
    
    func testRequestSuccessful () {
        // Arrange
        let apiExpectation = self.expectation(description: "testRequestSuccessful call")
        var requestResult: CustomResult<Dictionary<String, String>>?
        
        // Act
        alamoFireWrapper.request(url: apiURL + simpleEndpoint, headers: emptyHeaders, type: Dictionary<String, String>.self) { result in
            
            requestResult = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert
        XCTAssertEqual(requestResult?.result, .success)
    }
    
    func testRequestSuccessfulJSONParse () {
        // Arrange
        let apiExpectation = self.expectation(description: "testRequestSuccessful call")
        var requestResult: CustomResult<Dictionary<String, String>>?
        
        // Act
        alamoFireWrapper.request(url: apiURL + simpleEndpoint, headers: emptyHeaders, type: Dictionary<String, String>.self) { result in
            
            requestResult = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert
        XCTAssertNotNil(requestResult?.value)
    }

    func testRequestURLFailure () {
        // Arrange
        let apiExpectation = self.expectation(description: "testRequestSuccessful call")
        var requestResult: CustomResult<Dictionary<String, String>>?
        
        // Act
        alamoFireWrapper.request(url: apiURL + fakeEndpoint, headers: emptyHeaders, type: Dictionary<String, String>.self) { result in
            
            requestResult = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert
        XCTAssertEqual(requestResult?.result, .requestError)
    }
    
    func testRequestJSONParseFailure () {
        // Arrange
        let apiExpectation = self.expectation(description: "testRequestSuccessful call")
        var requestResult: CustomResult<Dictionary<String, Int>>?
        
        // Act
        alamoFireWrapper.request(url: apiURL + simpleEndpoint, headers: emptyHeaders, type: Dictionary<String, Int>.self) { result in
            
            requestResult = result
            apiExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        // Assert
        XCTAssertEqual(requestResult?.result, .parsingError)
    }
}
