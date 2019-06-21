//
//  SATData.swift
//  NYC School SAT Scores
//
//  Created by Matthew Hamilton on 6/13/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import Foundation



/// A generic struct for mapping Schools from https://data.cityofnewyork.us/resource/f9bf-2cp4.json
///
/// Normally this would be typed by hand with a better naming convention, but to save time
///   I used https://app.quicktype.io/ to quickly generate this struct

struct SATData: Codable {
    let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String
    let satMathAvgScore, satWritingAvgScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
