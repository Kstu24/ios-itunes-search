//
//  SearchResult.swift
//  Itunes Search
//
//  Created by Kevin Stewart on 1/17/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import Foundation

struct SearchResults: Decodable {
    let results: [SearchResult]
}


struct SearchResult: Codable {
    let title: String
    let creator: String
    
    enum CodingKeys: String, CodingKey {
        typealias RawValue = CodingKey
        case title = "trackName"
        case creator = "artistName"
        

    }
}


