//
//  MainView.swift
//  WPArticleLoader-ExampleApp
//
//  Created by Torben Köhler on 05.08.21.
//

import SwiftUI

struct MainView: View {
    // The Article Loader is in the Model
    @StateObject var model: MainViewModel

    init() {
        self._model = StateObject(wrappedValue: MainViewModel())
    }

    var body: some View {
        NavigationView {
            if !model.articles.isEmpty {
                List {
                    ForEach(model.articles) { article in
                        NavigationLink(
                            destination: ArticleView(article: article),
                            label: {
                                Text("\(article.title) von \(article.author.name)")
                            })
                    }
                }
                .navigationTitle("ML-Projects Blog")
            } else {
                ProgressView()
                    .onAppear(perform: {
                        model.reloadArticles()
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
