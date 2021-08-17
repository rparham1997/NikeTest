//
//  ImageCache.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import UIKit

/// A key-value coded cache that downloads and serves images.
class ImageCache {

    private let imageCache = NSCache<NSString, UIImage>()

    /// The singleton instance.
    static let shared: ImageCache = {
        let instance = ImageCache()
        
        return instance
    }()
    
    private init() {}
    
    /// Serves an image from the cache or downloads it and stores it in the cache.
    func downloadImage(url: URL, completion: @escaping (Result<UIImage, Error> ) -> ()) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(.success(cachedImage))
        } else {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(.success(image))
                } else {
                    completion(.failure(ErrorMessage("Missing data when loading image.")))
                }
            })
            task.resume()
        }
    }

}

