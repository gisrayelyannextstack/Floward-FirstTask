//
//  UserDetailsView.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import SwiftUI

struct UserDetailsView: View {
    @ObservedObject private var viewModel: UserDetailsViewModel
    
    init(user: User) {
        self.viewModel = UserDetailsViewModel(user: user)
    }
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.user.posts) { post in
                    PostRow(post: post)
                        .listRowSeparator(.hidden)
                }
            } header: {
                if let url = viewModel.user.url {
                    AsyncImage(url: url) { uiimage in
                        Image(uiImage: uiimage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .clipped()
                            .cornerRadius(12)
                    }
                }
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .listSectionSeparator(.hidden)
        .navigationTitle(viewModel.user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
