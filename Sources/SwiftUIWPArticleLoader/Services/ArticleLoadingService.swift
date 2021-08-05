//
//  ArticleLoader.swift
//
//
//  Created by Torben Köhler on 25.07.21.
//

import Combine
import Foundation

@available(macOS 10.15, *)
public struct ArticleLoadingService {
    public func fetchArticles(urlRequest: URLRequest) -> AnyPublisher<[Article], Error> {
        Deferred {
            Future<[Article], Error> { promise in
                URLSession.shared.dataTask(with: urlRequest){ (data, _, _) in
                    guard let data = data else { return }
                    do {
                        let articles = try JSONDecoder().decode([ContentfulArticle].self, from: data)
                        promise(.success(articles.map({ Article(from: $0) })))
                    } catch {
                        promise(.failure(error))
                    }
                }.resume()
            }
        }
        .eraseToAnyPublisher()
    }
    public func fetchContentfulArticles(urlRequest: URLRequest) -> AnyPublisher<[ContentfulArticle], Error> {
        Deferred {
            Future<[ContentfulArticle], Error> { promise in
                URLSession.shared.dataTask(with: urlRequest){ (data, _, _) in
                    guard let data = data else { return }
                    do {
                        let articles = try JSONDecoder().decode([ContentfulArticle].self, from: data)
                        promise(.success(articles))
                    } catch {
                        promise(.failure(error))
                    }
                }.resume()
            }
        }
        .eraseToAnyPublisher()
    }
}
