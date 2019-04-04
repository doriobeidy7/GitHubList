//
//  TrendingModel.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit

//// MARK: - View Model
struct TrendingViewModel{
    
    let trendingModel: TrendingModel
    
    private(set) var name = ""
    private(set) var description = ""
//    private(set) var ownerImage = URL("")
    private(set) var full_name = ""
    private(set) var stargazers_count = 0
    
    init(trendingModel: TrendingModel) {
      
        self.trendingModel = trendingModel
        updateProperties()
    }

    
    private mutating func updateProperties() {
        
        name = setNameString(trendingModel: trendingModel)
        description = setDescriptionString(trendingModel: trendingModel)
//        ownerImage = setImageLink(trendingModel: trendingModel)
        full_name = setOwnerNameSring(trendingModel: trendingModel)
        stargazers_count = setStarNumberName(trendingModel: trendingModel)

    }
}

extension TrendingViewModel {
    
    private func setNameString(trendingModel: TrendingModel) -> String {
        return trendingModel.items[0].name
    }
    
    private func setDescriptionString(trendingModel: TrendingModel) -> String {
        return trendingModel.items[0].description
    }
    
//    private func setImageLink(trendingModel: TrendingModel) -> URL {
//        return trendingModel.items[0].avatar_url
//    }
    
    private func setOwnerNameSring(trendingModel: TrendingModel) -> String {
        return trendingModel.items[0].fullName
    }
    
    private func setStarNumberName(trendingModel: TrendingModel) -> Int {
        return trendingModel.items[0].stargazersCount
    }
}



