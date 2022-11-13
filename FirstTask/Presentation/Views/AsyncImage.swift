//
//  AsyncImage.swift
//  FirstTask
//
//  Created by Gerasim Israyelyan on 13.11.22.
//

import SwiftUI

struct AsyncImage<Content: View>: View {
    @StateObject private var loader: ImageLoader
    private let image: (UIImage) -> Content
    
    init(url: URL,
        @ViewBuilder image: @escaping (UIImage) -> Content = Image.init(uiImage:)) {
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                Text("")
            }
        }
    }
}
