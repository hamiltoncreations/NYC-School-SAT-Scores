//
//  SchoolInfoViewModel.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/15/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import UIKit

class SchoolInfoViewModel {

    private let schoolInfo: SchoolInfo
    
    init (schoolInfo: SchoolInfo) {
        self.schoolInfo = schoolInfo
    }
    
    var dbn: String {
        return self.schoolInfo.dbn ?? ""
    }
}

extension SchoolInfoViewModel {
    
    // Display Extension
    
    var schoolNameText: String {
        return self.schoolInfo.schoolName ?? ""
    }
    
    var address1Text: String {
        return self.schoolInfo.primaryAddressLine1 ?? ""
    }
    
    
    /// Require all location data to display
    var cityStateZipText: String {
        
        guard let city = self.schoolInfo.city, let state = self.schoolInfo.stateCode,
            let zip = self.schoolInfo.zip else {
                return ""
        }
        
        return "\(city), \(state) \(zip)"
    }
    
    var schoolParagraphText: String {
        return self.schoolInfo.overviewParagraph ?? ""
    }
}
