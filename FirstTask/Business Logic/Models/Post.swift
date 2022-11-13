//
//  Post.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation

struct Post: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
