//
//  ImageLoader.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Combine
import UIKit

public class ImageLoader: ObservableObject {
    @Published public var image: UIImage?
    private let url: URL

    public init(url: URL) {
        self.url = url
        load()
    }

    deinit {
        cancel()
    }

    private var cancellable: AnyCancellable?

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
