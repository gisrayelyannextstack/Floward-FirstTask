//
//  PostRow.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text(post.title)
                .font(.system(size: 16, weight: .bold))
            Text(post.body)
                .font(.system(size: 14, weight: .regular))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(color: .black.opacity(0.12), radius: 3)
        )
    }
}
