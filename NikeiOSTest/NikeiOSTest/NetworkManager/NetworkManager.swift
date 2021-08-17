//
//  NetworkManager.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import Foundation

struct AlbumApi {
    
    /// This will call the api
    static func fetchAlbumsJSON(completion: @escaping (Result<[Album], Error>) ->()) {
        let albumUrlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json"
        guard let albumUrl = URL(string: albumUrlString) else {
            return
        }
        URLSession.shared.dataTask(with: albumUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let feed = try decoder.decode(Feed.self, from: data)
                    let albums = feed.albums
                    completion(.success(albums))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(ErrorMessage("Missing data when fetching albums.")))
            }
    
        }.resume()
    }
    
}
