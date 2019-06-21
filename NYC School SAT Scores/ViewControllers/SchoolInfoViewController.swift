//
//  SchoolInfoViewController.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/15/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import UIKit
import Alamofire

class SchoolInfoViewController: UIViewController {

    // School Detail Outlets
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var cityStateZipLabel: UILabel!
    @IBOutlet weak var schoolParagraphLabel: UILabel!
    
    // SAT Score Outlets
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var numTestTakersLabel: UILabel!
    
    
    var schoolInfoViewModel: SchoolInfoViewModel? = nil
    private var satDataViewModel: SATDataViewModel? = nil
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // If schoolInfoViewModel is nil, go back
        guard let schoolInfoViewModel = schoolInfoViewModel else {
            popView()
            return
        }
            
        // If there was more logic involved in these fields, we could consider being reactive
        schoolNameLabel.text = schoolInfoViewModel.schoolNameText
        address1Label.text = schoolInfoViewModel.address1Text
        cityStateZipLabel.text = schoolInfoViewModel.cityStateZipText
        schoolParagraphLabel.text = schoolInfoViewModel.schoolParagraphText
        
        if !schoolInfoViewModel.dbn.isEmpty {
           requestSATData(dbn: schoolInfoViewModel.dbn)
        }
    }
    
    /// In the case of missing SchoolInfoViewModel, we want to revert to the Schoollist
    func popView () {
        AlertWrapper().displayAlert(title: "Missing Required Info", message: "Returning to School List")
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    /// Sets SAT Score labels once the satDataViewModel is available
    func refreshSATScores () {
        if satDataViewModel != nil {
            mathScoreLabel.text = satDataViewModel?.mathScoreText
            readingScoreLabel.text = satDataViewModel?.readingScoreText
            writingScoreLabel.text = satDataViewModel?.writingScoreText
            numTestTakersLabel.text = satDataViewModel?.numTestTakersText
        }
    }
    
    /// Fetch the SAT Scores from the NYC API and populate the view model
    ///
    /// - Parameter dbn: The unique identifer of the School for requesting SAT Scores
    func requestSATData(dbn: String) {
        
        NYCOpenAPIService().getSATScores(dbn: dbn) { satInfo in
            if let satInfo = satInfo {
                self.satDataViewModel = SATDataViewModel(satData: satInfo)
                self.refreshSATScores()
            }
        }
    }

}
