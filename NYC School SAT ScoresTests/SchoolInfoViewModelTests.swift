//
//  NYC_School_SAT_SCoresTests.swift
//  NYC School SAT SCoresTests
//
//  Created by Matthew Hamilton on 6/13/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import XCTest
@testable import NYC_School_SAT_SCores


class SchoolInfoViewModelTests: XCTestCase {

    func testInit() {
        // Arrange
        
        guard let schoolInfo = MockUtilities.generateSchoolInfo(jsonString: MockConstants.schoolJSON) else {
            XCTFail("schoolInfo not setup correctly")
            return
        }
        
        // Act
        let schoolInfoViewModel = SchoolInfoViewModel(schoolInfo: schoolInfo)
        
        // Assert
        XCTAssertNotNil(schoolInfoViewModel)
    }

    func testDBNValue() {
        // Arrange
        guard let schoolInfo = MockUtilities.generateSchoolInfo(jsonString: MockConstants.schoolJSON) else {
            XCTFail("schoolInfo not setup correctly")
            return
        }
        
        // Act
        let schoolInfoViewModel = SchoolInfoViewModel(schoolInfo: schoolInfo)
        
        // Assert
        XCTAssertFalse(schoolInfoViewModel.dbn.isEmpty)
    }
    
    func testValidCityStateZip () {
        // Arrange
        guard let schoolInfo = MockUtilities.generateSchoolInfo(jsonString: MockConstants.schoolJSON) else {
            XCTFail("schoolInfo not setup correctly")
            return
        }
        
        // Act
        let schoolInfoViewModel = SchoolInfoViewModel(schoolInfo: schoolInfo)
        
        // Assert
        XCTAssertFalse(schoolInfoViewModel.cityStateZipText.isEmpty)
    }
    
    func testInvalidCityStateZip () {
        // Arrange
        guard let schoolInfo = MockUtilities.generateSchoolInfo(jsonString: MockConstants.schoolJSONNoCityValue) else {
            XCTFail("schoolInfo not setup correctly")
            return
        }
        
        // Act
        let schoolInfoViewModel = SchoolInfoViewModel(schoolInfo: schoolInfo)
        
        // Assert
        XCTAssertTrue(schoolInfoViewModel.cityStateZipText.isEmpty)
    }
    
}
