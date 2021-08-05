//
//  MainViewModel.swift
//  WPArticleLoader-ExampleApp
//
//  Created by Torben Köhler on 05.08.21.
//

import SwiftUI
import SwiftUIWPArticleLoader
import Combine

class MainViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private var cancellables: Set<AnyCancellable> = []

    func reloadArticles() {
        // Create your handler that fetches the Articles from your Website
        let handler = WPArticleLoader(websiteAdress: URL(staticString: "https://ml-projects.de"))
        handler.fetchArticles()
            .receive(on: DispatchQueue.main)
            .sink { response in
                switch response {
                case let .failure(error):
                    print(error)
                case .finished:
                    print("Articles loaded")
                }
            } receiveValue: { [weak self] response in
                self?.articles = response
            }
            .store(in: &cancellables)
    }
}
