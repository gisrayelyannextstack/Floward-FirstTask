//
//  APIEnvironment.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation

enum APIEnvironment {
    case test
    
    static var current: Self { .test }
    
    var baseURL: String {
        return "https://my-json-server.typicode.com/"
    }
}
