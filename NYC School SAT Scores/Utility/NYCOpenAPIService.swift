//
//  NYCOpenAPIService.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/19/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//
import Foundation

class NYCOpenAPIService: NSObject {

    struct NYCOpenAPIConfig {
        static let baseURL = "https://data.cityofnewyork.us/resource/"
        static let schoolInfoEndpoint = "s3k6-pzi2.json"
        static let satScoreEndpoint = "f9bf-2cp4.json?dbn="
        
        static let headers = [
            "X-Mashape-Key": "62DmBEg30qmUgsrJsVIwLyXvu",
            "Accept": "application/json"
        ]
    }
    
    
    
    /// Requests a list of schools from the NYCOpenAPI. Results are received in JSON then converted to SchoolInfo
    ///  objects, these are returned to the caller through the completion closure
    ///
    /// - Parameter completion: Closure for passing back the received list of SchoolInfo objects
    func getSchools(completion: @escaping ([SchoolInfo]) -> Void) {
        
        AlamoFireWrapper().request(url: NYCOpenAPIConfig.baseURL + NYCOpenAPIConfig.schoolInfoEndpoint, headers: NYCOpenAPIConfig.headers, type: [SchoolInfo].self) {result in
            switch result.result {
            case .success:
                if let schools = result.value {
                    completion(schools)
                    return
                }
            case .requestError:
                // Display business approved message or give users a method to contact support
                AlertWrapper().displayAlert(title: "Cannot connect to service,", message: "Please try again later.")
            case .parsingError:
                AlertWrapper().displayAlert(title: "Cannot Process Data", message: "Please try again later.")
            }
            
            completion([SchoolInfo]())
        }
        
    }
    
    /// Requests a list of schools from the NYCOpenAPI. Results are received in JSON then converted to SchoolInfo
    ///  objects, these are returned to the caller through the completion closure.
    ///
    /// - Note: Not every school maps back to SAT Data, a nil return on success is possible
    ///
    /// - Parameter dbn: The unique identifer from a SchoolInfo used to identify the correct SAT data
    /// - Parameter completion: Closure for passing back the received SAT Scores (SATData type)
    func getSATScores(dbn: String, completion: @escaping (SATData?) -> Void) {
        
        AlamoFireWrapper().request(url: NYCOpenAPIConfig.baseURL + NYCOpenAPIConfig.satScoreEndpoint + dbn, headers: NYCOpenAPIConfig.headers, type: [SATData].self) {result in
            switch result.result {
            case .success:
                
                // Let's safely unwrap all needed objects in addition to verifying an SAT Score for the DBN was found
                //   As a successfuly call could still yield 0 results
                if let results = result.value, let satInfo = results.first {
                    completion(satInfo)
                    return
                }
            case .requestError:
                // Display business approved message or give users a method to contact support
                AlertWrapper().displayAlert(title: "Cannot connect to service", message: "Please try again later.")
            case .parsingError:
                AlertWrapper().displayAlert(title: "Cannot Process Data", message: "Please try again later.")
            }
            
            completion(nil)
        }
    }
}
