//
//  Feed.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import Foundation


// The model for the RSS feed from iTunes.
struct Feed: Codable {

    // The array of Albums.
    let albums: [Album]

    // The keys for decoding a *Feed*.
    enum FeedKeys: CodingKey {
        case feed
    }
    
    // The keys for decoding the results array.
    enum ResultsKeys: CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let feed = try decoder.container(keyedBy: FeedKeys.self)
        let results = try feed.nestedContainer(keyedBy: ResultsKeys.self, forKey: .feed)
        self.albums = try results.decode([Album].self, forKey: .results)
    }

}
