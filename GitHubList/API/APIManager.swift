//
//  APIManager.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import Foundation

class APIManager {
    let DataURL = ""
    
    // Get trending data for last 30 days from github
    func getTrending(completion: @escaping (_ trending: TrendingModel?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: DataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createObjectWith(json: data, completion: { (trending, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(trending, nil)
            })
        }
    }
    
}

extension APIManager {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
    private func createObjectWith(json: Data, completion: @escaping (_ data: TrendingModel?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let trending = try decoder.decode(TrendingModel.self, from: json)
            return completion(trending, nil)
            
        } catch let error {
            print("Error creating getting data from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}
