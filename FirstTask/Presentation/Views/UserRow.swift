//
//  UserRow.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import SwiftUI

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            if let url = user.thumbnailUrl {
                AsyncImage(url: url) { uiImage in
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 72, height: 72)
                        .cornerRadius(8)
                }
            }
            VStack(alignment: .leading) {
                Spacer()
                Text("Name: ")
                    .font(.system(size: 14, weight: .medium))
                +
                Text(user.name)
                    .font(.system(size: 14, weight: .regular))
                Spacer()
                Text("Posts count: ")
                    .font(.system(size: 14, weight: .medium))
                +
                Text("\(user.posts.count)")
                    .font(.system(size: 14, weight: .regular))
                Spacer()
            }
            .padding(.vertical, 8)
            Spacer()
            Image(systemName: "chevron.compact.right")
                .frame(width: 24, height: 24)
                .foregroundColor(.black)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(color: .black.opacity(0.12), radius: 3)
        )
    }
}
