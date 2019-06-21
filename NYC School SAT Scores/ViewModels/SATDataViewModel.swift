//
//  SATDataViewModel.swift
//  NYC School SAT Scores
//
//  Created by Matthew Hamilton on 6/15/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import UIKit

class SATDataViewModel {

    private let satData: SATData
    
    init (satData: SATData) {
        self.satData = satData
    }
}


extension SATDataViewModel {
    
    var writingScoreText: String {
        return "Writing: \(self.satData.satWritingAvgScore)"
    }
    
    var mathScoreText: String {
        return "Math: \(self.satData.satMathAvgScore)"
    }
    
    var readingScoreText: String {
        return "Reading: \(self.satData.satCriticalReadingAvgScore)"
    }
    
    var numTestTakersText: String {
        return "Student Testers: \(self.satData.numOfSatTestTakers)"
    }
}
