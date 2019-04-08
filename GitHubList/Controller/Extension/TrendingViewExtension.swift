//
//  TrendingViewExtension.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//
import UIKit

let imageCache = NSCache<NSString, UIImage>()
private var count = 1
//var trendingModel = TrendingModel(items: [])
// MARK: - UITableView Data Source
private let apiManager = APIManager()


// MARK: - UIViewController
extension TrendingViewController: TrendingViewModelDelegate {
    
    func setUpTableView() {
        dataSource.delegate = self
    }
    
    func loadData()  {
        dataSource.getTrending(page: count)
        count = count + 1
    }
    
    
    func didRecieveDataUpdate(data: TrendingModel) {
        rowNumber = dataArray.count
        self.dataArray.append(contentsOf: data.items)
    }
    
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
}

extension TrendingViewController : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let trendingCount = dataArray.count
        
        return  trendingCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "GithubCell", for: indexPath) as! GitHubCell
        
        let indexRow = indexPath.row
        let trending = dataArray
        let name = trending[indexRow].fullName
        let desc = trending[indexRow].description
        let ownerName = trending[indexRow].name
        let stargazersCount = String(trending[indexRow].stargazersCount)
        let imageRepo = trending[indexRow].owner.avatarUrl
        
        tableViewCell.nameLabel?.text = name
        tableViewCell.descLabel?.text = desc
        tableViewCell.ownerNameLabel?.text = ownerName
        tableViewCell.starsNbrLabel?.text =  stargazersCount
        
        tableViewCell.repoImageView?.loadImageWithUrl(urlString: imageRepo!)
        
        
        return tableViewCell
    }
    
    
} // end extension TrendingViewController : UITableViewDataSource


// MARK: - UITableView Delegate
extension TrendingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let endScrolling:CGFloat = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if(endScrolling >= scrollView.contentSize.height){
            
            loadData()
            
        }
    }
    
    
    
}// end extension TrendingViewController : UITableViewDelegate




