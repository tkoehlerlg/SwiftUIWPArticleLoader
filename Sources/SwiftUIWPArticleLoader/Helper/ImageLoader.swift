//
//  ImageLoader.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Foundation
import Combine
#if !os(macOS)
import UIKit
#endif

@available(macOS 10.15, *)
public class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    #if !os(macOS)
    @Published public var image: UIImage?
    #endif
    public let url: URL
    // MARK: init
    public init(url: URL) {
        self.url = url
        #if !os(macOS)
        load()
        #endif
    }
    deinit {
        cancel()
    }
    // MARK: reload
    #if !os(macOS)
    public func reload() { load() }
    private func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    #endif
    func cancel() {
        cancellable?.cancel()
    }
}

