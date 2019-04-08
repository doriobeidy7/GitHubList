//
//  TrendingModel.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit


struct TrendingModel: Codable {
    var items: [Items]
    
}
struct Owner: Codable {
    let avatarUrl: String!
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
    
}

struct Items: Codable {
    let name: String!
    let fullName: String!
    let description: String!
    let stargazersCount: Int!
    let owner: Owner!
    
     enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case owner = "owner"
    }

}
