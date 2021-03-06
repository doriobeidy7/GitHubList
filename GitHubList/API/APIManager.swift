//
//  APIManager.swift
//  GitHubList
//
//  Created by Dori on 4/3/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import Foundation

class APIManager {
    
    let basicUrl = "https://api.github.com/"
    let createdDate = "2019-03-04"
    
    let currentDate: Date = Date()
    
    
    // Get trending data for last 30 days from github
    func getTrending(page: String, completion: @escaping (_ trending: TrendingModel?, _ error: Error?) -> Void) {
        let thirtyDaysBeforeToday = Calendar.current.date(byAdding: .day, value: -30, to: currentDate)!
        
        let date =  thirtyDaysBeforeToday.dateFormatted(with: "yyyy-MM-dd", date: thirtyDaysBeforeToday)
        
        let DataURL = "\(basicUrl)search/repositories?q=created:>\(date)&sort=stars&order=desc&page=\(page)"
        
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

// Extension for APIManger so we can show clear details
extension APIManager {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        guard let url = URL(string: escapedString!) else {
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
            
            let response = try decoder.decode(TrendingModel.self, from: json)
            
            return completion(response, nil)
            
        } catch let error {
            print("Error getting data from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}


