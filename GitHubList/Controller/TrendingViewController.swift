//
//  FirstViewController.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    private(set) var trendingViewModel: TrendingViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var searchResult: TrendingModel? {
        didSet {
            guard let searchResult = searchResult else { return }
            trendingViewModel = TrendingViewModel.init(trendingModel: searchResult)
            
            DispatchQueue.main.async {
                self.setUpTableView()
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTrending()
    }
}

