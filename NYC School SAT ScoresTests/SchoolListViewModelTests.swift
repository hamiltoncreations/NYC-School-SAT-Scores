//
//  SchoolListViewModelTests.swift
//  NYC School SAT SCoresTests
//
//  Created by Matthew Hamilton on 6/19/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import XCTest
@testable import NYC_School_SAT_SCores

class SchoolListViewModelTests: XCTestCase {

    class MockSchoolListViewModelDelegate: SchoolListViewModelDelegate {
        func schoolListRefreshed() {
            
        }
    }
    
    let mockDelegate = MockSchoolListViewModelDelegate()
    
    func testSchoolListViewModelAtIndex () {
        // Arrange
        let viewModel = SchoolListViewModel(delegate: mockDelegate)
        
        guard let schoolInfo = MockUtilities.generateSchoolInfo(jsonString: MockConstants.schoolJSON) else {
            XCTFail("schoolInfo not setup correctly")
            return
        }
        
        let schoolInfoViewModelA = SchoolInfoViewModel(schoolInfo: schoolInfo)
        viewModel.schoolViewModels.append(schoolInfoViewModelA)
        
        // Act
        let schoolInfoViewModelB = viewModel.schoolViewModel(at: 0)
        
        // Assert
        XCTAssertEqual(schoolInfoViewModelA.dbn, schoolInfoViewModelB.dbn)
    }

}
