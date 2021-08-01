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
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let articles = try decoder.decode([ContentfulArticle].self, from: data)
                        promise(.success(articles.map({ Article(from: $0) })))
                    } catch DecodingError.dataCorrupted(let context) {
                        print(context)
                    } catch DecodingError.keyNotFound(let key, let context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch DecodingError.valueNotFound(let value, let context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch DecodingError.typeMismatch(let type, let context) {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                }.resume()
            }
        }
        .eraseToAnyPublisher()
    }
}
