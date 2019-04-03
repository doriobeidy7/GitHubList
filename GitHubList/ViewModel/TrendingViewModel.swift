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
    private(set) var ownerName = ""
    private(set) var starsNumber = ""
    
    init(trendingModel: TrendingModel) {
      
        self.trendingModel = trendingModel
        updateProperties()
    }

    
    private mutating func updateProperties() {
        
        name = setNameString(trendingModel: trendingModel)
        description = setDescriptionString(trendingModel: trendingModel)
        ownerImage = setImageLink(trendingModel: trendingModel)
        ownerName = setOwnerNameSring(trendingModel: trendingModel)
        starsNumber = setStarNumberName(trendingModel: trendingModel)

    }
}

extension TrendingViewModel {
    
    private func setNameString(trendingModel: TrendingModel) -> String {
        return trendingModel.name
    }
    
    private func setDescriptionString(trendingModel: TrendingModel) -> String {
        return trendingModel.description
    }
    
    private func setImageLink(trendingModel: TrendingModel) -> String {
        return trendingModel.ownerImage
    }
    
    private func setOwnerNameSring(trendingModel: TrendingModel) -> String {
        return trendingModel.ownerName
    }
    
    private func setStarNumberName(trendingModel: TrendingModel) -> String {
        return trendingModel.starsNumber
    }
}
