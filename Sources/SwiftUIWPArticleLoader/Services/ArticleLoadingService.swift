//
//  ArticleLoader.swift
//
//
//  Created by Torben Köhler on 25.07.21.
//

import Combine
import Foundation

@available(macOS 10.15, *)
struct ArticleLoadingService {
    func fetchArticles(url: URL) -> AnyPublisher<[Article], Error> {
        Deferred {
            Future<[Article], Error> { promise in
                URLSession.shared.dataTask(with: url){ (data, _, _) in
                    guard let data = data else { return }
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    do {
                        let articles = try decoder.decode([ContentfulArticle].self, from: data)
                        promise(.success(articles.map({ Article(from: $0) })))
                    } catch {
                        promise(.failure(error))
                    }
                }.resume()
            }
        }
        .eraseToAnyPublisher()
    }
}
