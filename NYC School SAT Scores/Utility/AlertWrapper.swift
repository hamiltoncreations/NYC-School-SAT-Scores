//
//  AlertWrapper.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/17/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import UIKit

class AlertWrapper: NSObject {

    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("default")
            case .destructive:
                print("default")
            @unknown default:
                print("default")
            }})
        
        // If this app were to grow, I'd add in support for passing in a completion handler.
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
