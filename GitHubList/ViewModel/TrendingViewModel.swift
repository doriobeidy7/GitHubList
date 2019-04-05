//
//  TrendingModel.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit

//// MARK: - View Model
class TrendingViewModel: NSObject{
    
    let trendingModel: TrendingModel
    
    
    private(set) var items = [Items]()
    
    init(trendingModel: TrendingModel) {
        
        self.trendingModel = trendingModel
        
    }
    
}

extension TrendingViewModel {
    private func setItems(trendingModel: TrendingModel) -> [Any] {
        return trendingModel.items
    }
}



