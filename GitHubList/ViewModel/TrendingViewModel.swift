//
//  TrendingModel.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit


//protocol to handle data and error
protocol TrendingViewModelDelegate: class {
    func didRecieveDataUpdate(data: TrendingModel)
    func didFailDataUpdateWithError(error: Error)
}




//// MARK: - View Model
class TrendingViewModel: NSObject{
    
    private let apiManager = APIManager()
    
    //Handling data using delegate
    weak var delegate: TrendingViewModelDelegate?
    
    
    private func handleError(error: Error) {}
    
    func setDataWithResponse(response: TrendingModel) {
        delegate?.didRecieveDataUpdate(data: response)
    }
    
    
    
    func getTrending(page: Int) {
        
        apiManager.getTrending(page: String(page)){ (trending, error) in
            if let error = error {
                print("Get trending error: \(error.localizedDescription)")
                return
            }
            guard  let trending = trending  else { return }
            
            self.setDataWithResponse(response: trending)
        }
    }
    
}


