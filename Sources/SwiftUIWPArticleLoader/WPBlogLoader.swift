//
//  WPArticleLoader.swift
//
//
//  Created by Torben Köhler on 25.07.21.
//

import Combine
import Foundation

@available(macOS 10.15, *)
struct WPArticleLoader {
    private(set) var articleAdress: URL
    private(set) var authorsAdress: URL
    private(set) var tagsAdress: URL

    //MARK: Services
    let articleLoader = ArticleLoadingService()

    /// for automatic crowling
    init(websiteAdress: String) {
        self.articleAdress = URL(staticString: websiteAdress+"/wp-json/wp/v2/posts?_embed")
        self.authorsAdress = URL(staticString: websiteAdress+"/wp-json/wp/v2/categories")
        self.tagsAdress = URL(staticString: websiteAdress) //TODO: find adress
    }

    /// for own costumazation
    init(
        articleAdress: String,
        authorsAdress: String,
        tagsAdress: String
    ) {
        self.articleAdress = URL(staticString: articleAdress)
        self.authorsAdress = URL(staticString: authorsAdress)
        self.tagsAdress = URL(staticString: tagsAdress)
    }

    func fetchArticles() -> AnyPublisher<[Article], Error> {
        articleLoader.fetchArticles(url: articleAdress)
        
    }

//    func fetchCategories() {
//        guard let url = URL(string: "https://clickbaitml.de/wp-json/wp/v2/categories") else { return }
//        URLSession.shared.dataTask(with: url){ (data, _, _) in
//            guard let data = data else { return }
//            let categories = try! JSONDecoder().decode([Category].self, from: data)
//            DispatchQueue.main.async {
//                self.categories = categories
//            }
//        }.resume()
//    }
}

//https://clickbaitml.de/wp-json/wp/v2/posts?_embed
