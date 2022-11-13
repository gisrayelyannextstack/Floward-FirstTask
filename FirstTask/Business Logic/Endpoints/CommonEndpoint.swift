//
//  CommonNetworkService.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation

enum CommonEndpoint: Endpoint {
    case users
    case posts
    
    var baseURL: URL {
        guard let url = URL(string: "https://my-json-server.typicode.com/") else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .users: return "SharminSirajudeen/test_resources/users"
        case .posts: return "SharminSirajudeen/test_resources/posts"
        }
    }
}
