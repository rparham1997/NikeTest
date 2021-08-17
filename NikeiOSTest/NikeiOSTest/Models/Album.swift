//
//  Album.swift
//  NikeiOSTest
//
//  Created by Ramar Parham on 8/17/21.
//

import Foundation

struct Album: Codable {

    let name: String
    let artistName: String
    let releaseDate: String
    let genres: [Genre]
    let url: String
    let artworkUrl: String
    let copyright: String

    enum CodingKeys: String, CodingKey {
        case name, artistName, releaseDate, genres, url, copyright
        case artworkUrl = "artworkUrl100"
    }
}
