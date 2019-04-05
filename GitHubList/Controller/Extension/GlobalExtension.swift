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
