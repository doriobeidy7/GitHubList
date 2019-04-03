//
//  TrendingViewExtension.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//
import UIKit

// MARK: - UITableView Data Source

extension TrendingViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //TrendingViewModel.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "GithubCell", for: indexPath) as! GitHubCell
        
        // #1 - The ViewModel is the app's de facto data source.
//        tableViewCell?.imageView?.image = UIImage(named: messierViewModel[indexPath.row].thumbnail)
//        tableViewCell?.textLabel?.text = messierViewModel[indexPath.row].formalName
//        tableViewCell?.detailTextLabel?.text = messierViewModel[indexPath.row].commonName
        
        return tableViewCell
    }

    
  
} // end extension TrendingViewController : UITableViewDataSource


// MARK: - UITableView Delegate
extension TrendingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}// end extension TrendingViewController : UITableViewDelegate
