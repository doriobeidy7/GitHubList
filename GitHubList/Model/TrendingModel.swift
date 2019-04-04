//
//  TrendingModel.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit


struct TrendingModel: Codable {
    let items: [Items]
}

struct Items: Codable {
    let name: String!
    let fullName: String!
    let description: String!
    let stargazersCount: Int!
    
    //        let avatar_url: URL
    
     enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        //            case avatar_url = "avatar_url"

        
    }
    
   
    
    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)

        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
    }
}
