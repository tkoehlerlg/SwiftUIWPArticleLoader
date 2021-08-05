//
//  ArticleView.swift
//  WPArticleLoader-ExampleApp
//
//  Created by Torben Köhler on 05.08.21.
//

import SwiftUI
import SwiftUIWPArticleLoader

struct ArticleView: View {
    var article: Article
    var body: some View {
        ScrollView {
            Text(article.content)
        }
        .navigationBarTitle(article.title)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: .mock)
    }
}
