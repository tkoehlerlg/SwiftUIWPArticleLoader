//
//  WPArticleLoader.swift
//
//
//  Created by Torben Köhler on 25.07.21.
//

import Combine
import Foundation

@available(macOS 10.15, *)
public struct WPArticleLoader {
    // MARK: URLs
    private(set) var articleURL: URL
    private(set) var authorsURL: URL
    private(set) var tagsURL: URL
    //MARK: Services
    let articleLoader = ArticleLoadingService()
    // MARK: init
    public init(websiteAdress: URL) {
        (articleURL, authorsURL, tagsURL) = (websiteAdress, websiteAdress, websiteAdress)
        articleURL.appendPathComponent("/wp-json/wp/v2/posts")
        authorsURL.appendPathComponent("/wp-json/wp/v2/categories")
        tagsURL.appendPathComponent("/wp-json/wp/v2/tags")
    }
    // customized init
    public init(
        articleURL: URL,
        authorsURL: URL,
        tagsURL: URL
    ) {
        self.articleURL = articleURL
        self.authorsURL = authorsURL
        self.tagsURL = tagsURL
    }
    // MARK: fetch Data
    public func fetchArticles() -> AnyPublisher<[Article], Error> {
        var components = URLComponents(string: articleURL.absoluteString)!
        components.queryItems = [
            URLQueryItem(name: "_embed", value: nil)
        ]
        let request = URLRequest(url: components.url!)
        return articleLoader.fetchArticles(urlRequest: request)
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
