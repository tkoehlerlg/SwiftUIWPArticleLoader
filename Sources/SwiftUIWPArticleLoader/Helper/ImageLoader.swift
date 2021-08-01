//
//  ImageLoader.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Combine
#if !os(macOS)
import UIKit

public class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    @Published public var image: UIImage?
    private let url: URL
    // MARK: init
    public init(url: URL) {
        self.url = url
        load()
    }
    deinit {
        cancel()
    }
    // MARK: reload
    public func reload() { load() }
    private func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    func cancel() {
        cancellable?.cancel()
    }
}
#endif
