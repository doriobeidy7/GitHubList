//
//  GlobalExtension.swift
//  GitHubList
//
//  Created by Dori on 4/5/19.
//  Copyright © 2019 Dori. All rights reserved.
//

import UIKit

// - Caching Images from url for fast loading
extension UIImageView {
    
    func loadImageWithUrl(urlString: String) {
        
        image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                if let unwrappedError = error {
                    print(unwrappedError)
                    return
                }
                
                if let unwrappedData = data, let downloadedImage = UIImage(data: unwrappedData) {
                    DispatchQueue.main.async(execute: {
                        imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                        self.image = downloadedImage
                    })
                }
                
            }
            dataTask.resume()
        }
    }
}


extension Date {
    func dateFormatted(with dateFormat: String , date: Date)->String{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date) // string purpose I add here
        // convert your string to date
        let myDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = dateFormat
        // again convert your date to string
        let stringDate = formatter.string(from: myDate!)
        return stringDate
        
    }
}

