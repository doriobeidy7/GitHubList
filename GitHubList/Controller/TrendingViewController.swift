//
//  FirstViewController.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    
    var rowNumber = 0
    var dataSource = TrendingViewModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [Items]() {
        didSet {
            //Reload tableview after receiving data using StoreTableViewDataModelDelegate protocol to get data.
            DispatchQueue.main.async(execute: { () -> Void in
                self.tableView.delegate = self
                self.tableView.dataSource = self
                
                self.tableView?.reloadData()
                self.tableView.tableViewScrollToBottom(animated: true, rowNumber: self.rowNumber)
            })
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        loadData()
    }
    
}
