//
//  SchoolListTableViewController.swift
//  NYC School SAT SCores
//
//  Created by Matthew Hamilton on 6/15/19.
//  Copyright © 2019 mhamilton. All rights reserved.
//

import UIKit

class SchoolListTableViewController: UITableViewController, SchoolListViewModelDelegate {

    private var schoolListViewModel: SchoolListViewModel? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        schoolListViewModel = SchoolListViewModel(delegate: self)
        
        // Generally I would unwrap safely. However, this is one of the first
        //  pieces of my logic hit, and to fail the initializer above means
        //  we have bigger problems, and have already failed spectacularly
        schoolListViewModel!.loadSchools()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let schoolListViewModel = self.schoolListViewModel else {
            return 0
        }
        return schoolListViewModel.schoolViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolListCell", for:indexPath)
        
        // All things considered, I'd be okay with not unwrapping as the app is useless without a valid schoolListVM
        if let schoolListViewModel = self.schoolListViewModel {
            let schoolVM = schoolListViewModel.schoolViewModel(at: indexPath.row)
            cell.textLabel?.text = schoolVM.schoolNameText
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Safely unwrapping multiple objects needed to continue
        if let indexPath = tableView.indexPathForSelectedRow,
            let schoolInfoViewController = segue.destination as? SchoolInfoViewController,
            let schoolListViewModel = self.schoolListViewModel {
        
            schoolInfoViewController.schoolInfoViewModel = schoolListViewModel.schoolViewModels[indexPath.row]
        }
    }

    // MARK: - SchoolListViewModel delegate methods
    func schoolListRefreshed() {
        self.tableView.reloadData()
    }
}
