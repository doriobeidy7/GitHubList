//
//  TrendingModel.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit


struct TrendingModel: Codable {
    
    let name: String
    let description: String
    let starsNumber: String
    let ownerImage: String
    let ownerName: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case starsNumber
        case ownerImage
        case ownerName

    }
}
