//
//  TrendingViewExtension.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//
import UIKit

private let apiManager = APIManager()
let imageCache = NSCache<NSString, UIImage>()

// MARK: - UITableView Data Source

extension TrendingViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TrendingViewModel.count
        return  trendingModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "GithubCell", for: indexPath) as! GitHubCell
        
        let indexRow = indexPath.row
        let name = trendingModel.items[indexRow].fullName
        let desc = trendingModel.items[indexRow].description
        let ownerName = trendingModel.items[indexRow].name
        let stargazersCount = String(trendingModel.items[indexPath.row].stargazersCount)
        let imageRepo = trendingModel.items[indexRow].owner.avatarUrl
        
        tableViewCell.nameLabel?.text = name
        tableViewCell.descLabel?.text = desc
        tableViewCell.ownerNameLabel?.text = ownerName
        tableViewCell.starsNbrLabel?.text = stargazersCount
        
        tableViewCell.repoImageView?.loadImageWithUrl(urlString: imageRepo!)
        
        
        
        return tableViewCell
    }
    
    
} // end extension TrendingViewController : UITableViewDataSource


// MARK: - UITableView Delegate
extension TrendingViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}// end extension TrendingViewController : UITableViewDelegate


// MARK: - UIViewController
extension TrendingViewController {
    
    func getTrending() {
        
        apiManager.getTrending() { (trending, error) in
            if let error = error {
                print("Get trending error: \(error.localizedDescription)")
                return
            }
            guard let trending = trending  else { return }
            self.searchResult = trending
        }
        
        
    }
    
    
    func setUpTableView() {
        tableView.delegate = trendingViewModel.self
        tableView.dataSource = trendingViewModel.self
    }
}



