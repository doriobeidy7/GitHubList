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
    private(set) var ownerImage = ""
    private(set) var full_name = ""
    private(set) var stargazers_count = 0
    private(set) var avatar_url = ""
    
    init(trendingModel: TrendingModel) {
      
        self.trendingModel = trendingModel
        updateProperties()
    }

    
    private mutating func updateProperties() {
        
        name = setNameString(trendingModel: trendingModel)
        description = setDescriptionString(trendingModel: trendingModel)
        avatar_url = setAvatarString(trendingModel: trendingModel)
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
    
    private func setAvatarString(trendingModel: TrendingModel) -> String {
        return trendingModel.items[0].owner.avatarUrl
    }
    
    private func setOwnerNameSring(trendingModel: TrendingModel) -> String {
        return trendingModel.items[0].fullName
    }
    
    private func setStarNumberName(trendingModel: TrendingModel) -> Int {
        return trendingModel.items[0].stargazersCount
    }
}



