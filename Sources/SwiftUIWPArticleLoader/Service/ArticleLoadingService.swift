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
                    do {
                        let articles = try JSONDecoder().decode([ContentfulArticle].self, from: data)
//                        promise(.success(articles)) TODO: Convert
                    } catch {
                        promise(.failure(error))
                    }
                }.resume()
            }
        }
        .eraseToAnyPublisher()
    }
}
