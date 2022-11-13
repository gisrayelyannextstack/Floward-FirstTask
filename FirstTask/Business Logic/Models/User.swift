//
//  User.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let albumId: Int
    let name: String
    let urlString: String
    let thumbnailUrlString: String
    var posts: [Post] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case albumId
        case name
        case urlString = "url"
        case thumbnailUrlString = "thumbnailUrl"
    }
    
    var url: URL? { URL(string: urlString) }
    
    var thumbnailUrl: URL? { URL(string: thumbnailUrlString) }
}
