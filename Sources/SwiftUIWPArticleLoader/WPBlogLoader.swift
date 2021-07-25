//
//  WPArticleLoader.swift
//
//
//  Created by Torben Köhler on 25.07.21.
//

import Combine
import Foundation

struct WPArticleLoader {
    let url: URL

    //MARK: Services
    let 

    /// Website Adress without path and https
    init(url: String) {
        self.url = URL(staticString: "http://\(url)")
    }

    func fetchArticles() -> AnyPublisher<[USState], Error> {
        reloadCategories()
        guard let url = URL(string: "https://clickbaitml.de/wp-json/wp/v2/posts?_embed") else { return }

        return Future<[USState], Error> { promise in
            URLSession.shared.dataTask(with: url){ (data, _, _) in
                guard let data = data else { return }
                let articles = try! JSONDecoder().decode([Article].self, from: data)
                DispatchQueue.main.async {
                    self.articles = articles
                }
            }.resume()
        }
    }

    func fetchCategories() {
        guard let url = URL(string: "https://clickbaitml.de/wp-json/wp/v2/categories") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let categories = try! JSONDecoder().decode([Category].self, from: data)
            DispatchQueue.main.async {
                self.categories = categories
            }
        }.resume()
    }
}
