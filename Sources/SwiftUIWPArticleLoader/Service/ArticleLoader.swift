//
//  ArticleLoader.swift
//
//
//  Created by Torben Köhler on 25.07.21.
//

import Combine
import Foundation

@available(macOS 10.15, *)
struct ArticleLoader {

    func fetchArticles(url: URL) -> AnyPublisher<[Article], Error> {
        Deferred {
            Future<[Article], Error> { promise in
                guard let url = URL(string: "https://clickbaitml.de/wp-json/wp/v2/posts?_embed") else {
                    promise(.failure(WPError.urlError))
                    return
                }
                if UIApplication.shared.canOpenURL(url as URL) {
                    
                }
                URLSession.shared.dataTask(with: url){ (data, _, _) in
                    guard let data = data else { return }
                    let articles = try! JSONDecoder().decode([Article].self, from: data)
                    promise(.success(articles))
                }.resume()
            }
        }
        .eraseToAnyPublisher()
    }

}

//func fetchCategories() {
//    guard let url = URL(string: "https://clickbaitml.de/wp-json/wp/v2/categories") else { return }
//    URLSession.shared.dataTask(with: url){ (data, _, _) in
//        guard let data = data else { return }
//        let categories = try! JSONDecoder().decode([Category].self, from: data)
//        DispatchQueue.main.async {
//            self.categories = categories
//        }
//    }.resume()
//}
