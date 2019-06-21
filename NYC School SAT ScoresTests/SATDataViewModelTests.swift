//
//  SATDataViewModelTests.swift
//  NYC School SAT SCoresTests
//
//  Created by Matthew Hamilton on 6/19/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import XCTest
@testable import NYC_School_SAT_SCores

class SATDataViewModelTests: XCTestCase {

    func generateFullSATData() -> SATData? {
        
        let sampleData = MockConstants.satScoreJSON.data(using: .utf8)!
        
        // Ignoring exception as the below tests will inform us of failure
        let satData = try? JSONDecoder().decode(SATData.self, from: sampleData)
        
        return satData
    }
    
    func testSATDataViewModelInit() {
        // Arrange
        guard let satData = generateFullSATData() else {
            XCTFail("satData not setup correctly")
            return
        }
        
        // Act
        let satDataViewModel = SATDataViewModel(satData: satData)
        
        // Assert
        XCTAssertNotNil(satDataViewModel)
    }
    
    

}
