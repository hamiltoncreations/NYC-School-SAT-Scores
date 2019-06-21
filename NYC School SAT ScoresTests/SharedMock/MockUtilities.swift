//
//  MockUtilities.swift
//  NYC School SAT SCoresTests
//
//  Created by Matthew Hamilton on 6/20/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//
import Foundation
@testable import NYC_School_SAT_SCores

/// Utility collection of logic for generating mock data
struct MockUtilities {

    static func generateSchoolInfo(jsonString: String) -> SchoolInfo? {
        
        let sampleData = jsonString.data(using: .utf8)!//MockConstants.schoolJSON.data(using: .utf8)!
        
        // Ignoring exception as the tests will inform us of failure
        let schoolInfo = try? JSONDecoder().decode(SchoolInfo.self, from: sampleData)
        
        return schoolInfo
    }
    
}
