//
//  AlamoFireWrapper.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/16/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import Foundation
import Alamofire


enum RequestStatus: Error {
    case success
    
    case requestError
    case parsingError
}


/// Tried to use the standard 'Result' type, but AlamoFire seems to have a conflicting typename
struct CustomResult<T: Codable> {
    var result: RequestStatus
    var value: T?
}

class AlamoFireWrapper {
    
    /// Performs a simple Get request and decodes the received JSON into the
    ///  desired Type of object
    ///
    /// - Parameter url: Target URL for the request
    /// - Parameter type: Type of object to parse from the JSON
    /// - Parameter completion: Block of code to run on completion of the request.
    ///     This returns a success/failure and the parsed object (if successful)
    func request<T: Codable> (url: String, headers: Dictionary<String, String>, type: T.Type, completion: @escaping (CustomResult<T>) -> Void) {
        
        Alamofire.request(url, headers: headers).responseJSON { (responseData) -> Void in
            
            guard let responseValue = responseData.result.value else {
                // Error occured with our request
                let error = CustomResult<T>(result: .requestError, value: nil)
                completion(error)
                
                return
            }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: responseValue, options: .prettyPrinted)
                
                let parsedObj = try JSONDecoder().decode(type, from: jsonData)
                
                let success = CustomResult<T>(result: .success, value: parsedObj)
                completion(success)
            }
            catch {
                // Error occured while working with the JSON
                let error = CustomResult<T>(result: .parsingError, value: nil)
                completion(error)
            }
        }
    }
}
