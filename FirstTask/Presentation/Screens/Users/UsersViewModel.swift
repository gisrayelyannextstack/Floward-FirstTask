//
//  UsersViewModel.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    private let networker = Networker()
    
    @Published var users: [User] = []
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        let usersRequest: AnyPublisher<[User], Error> = networker.request(endpoint: CommonEndpoint.users)
        let postsRequest: AnyPublisher<[Post], Error> = networker.request(endpoint: CommonEndpoint.posts)
        
        Publishers.Zip(usersRequest, postsRequest)
            .map { out in
                out.0.map { user in
                    var user = user
                    user.posts = out.1.filter({ $0.userId == user.id })
                    return user
                }
            }
            .replaceError(with: [])
            .assign(to: &$users)
    }
}
