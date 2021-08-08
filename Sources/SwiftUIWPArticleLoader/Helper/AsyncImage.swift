//
//  AsyncImage.swift
//  Clickbait ML Multi
//
//  Created by Torben Köhler on 13.06.21.
//

import SwiftUI
import Combine
import Foundation

#if !os(macOS)
@available(iOS 14, *)
public struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    // MARK: init
    public init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    public init(imageLoader: ImageLoader, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: imageLoader)
    }

    public var body: some View {
        content
    }
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
#endif
