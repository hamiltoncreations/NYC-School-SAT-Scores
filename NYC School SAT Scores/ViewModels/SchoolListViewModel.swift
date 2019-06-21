//
//  SchoolListViewModel.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/15/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import UIKit
import Alamofire

protocol SchoolListViewModelDelegate {
    
    func schoolListRefreshed ()
}

class SchoolListViewModel {

    internal var schoolViewModels: [SchoolInfoViewModel]
    var delegate: SchoolListViewModelDelegate? = nil
    
    init (delegate: SchoolListViewModelDelegate) {
        
        self.schoolViewModels = [SchoolInfoViewModel]()
        self.delegate = delegate
    }
    
    /// Fills the ViewModel with data returned from the NYC School API
    ///  - Note: This method may be public, but we could make it private if we remove
    ///   the tight dependancy on NYCOpenAPIService or modify NYCOpenAPIService
    ///   to allow for overriding the Alamofire Session Manager
    func loadSchools () {
        
        NYCOpenAPIService().getSchools() { schools in
            self.convertSchoolsToViewModels(schools: schools)
            self.delegate?.schoolListRefreshed()
        }
    }
    
    /// Populates schoolViewModels with the resulting [SchoolInfo] provided
    ///  by the NYC School API
    ///
    /// - Parameter schoolInfo: Array of SchoolInfo created from parsing
    ///   the NYC School JSON
    private func convertSchoolsToViewModels (schools: [SchoolInfo]) {
        
        for schoolInfo in schools {
            
            let vm = SchoolInfoViewModel(schoolInfo: schoolInfo)
            self.schoolViewModels.append(vm)
        }
    }
}

extension SchoolListViewModel {
    
    func schoolViewModel(at index: Int) -> SchoolInfoViewModel {
        return self.schoolViewModels[index]
    }
}
