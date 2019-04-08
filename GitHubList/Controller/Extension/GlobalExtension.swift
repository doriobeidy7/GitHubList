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

extension UITableView {
    
    func tableViewScrollToBottom(animated: Bool, rowNumber: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(0)) {
            
            let numberOfSections = self.numberOfSections
            var numberOfRows = 0
            
            if numberOfSections != 0 {
                numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            }
            if numberOfRows > 0 {
                
                let indexPath = IndexPath(row: rowNumber, section: (numberOfSections-1))
                self.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: animated)
            }
        }
    }
    
}
