//
//  UsersView.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject private var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                    UserRow(user: user)
                    .background(
                        NavigationLink(destination: UserDetailsView(user: user)) {
                            EmptyView()
                        }.opacity(0)
                    )
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .listSectionSeparator(.hidden)
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
