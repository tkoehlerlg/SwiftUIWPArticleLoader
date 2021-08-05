# SwiftUIWPArticleLoader

Hello to WPArticleLoader!

With the WPArticleLoader, you can easily load Articles from your WordPress Website.

## How to use?
The usage is very easy! The only thing you have to do is setting your website address and build a receiver for the Publisher:

```swift
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
    } receiveValue: { response in
        self.articles = response
    }
    .store(in: &cancellables)
```


The Article class holds the most important Data and interprets it. If you want to interpret the data on your own you can use the **ArticleLoadingService** and receive ContentfulArticle. In ContentfulArticle is the complete Data from the _JSON_ of the _REST API_. You can use the **ArticleLoadingService** like this:

```swift
let articleURL = URL(staticString: "https://ml-projects.de/wp-json/wp/v2/posts")
var components = URLComponents(string: articleURL.absoluteString)!
// this is to get the embeded Data too (The Embeded Data is used by the normal Loader too)
components.queryItems = [
    URLQueryItem(name: "_embed", value: nil)
]
// Create a URLRequest
let request = URLRequest(url: components.url!)
// Create the handler
let handler = ArticleLoadingService()
handler.fetchArticles(urlRequest: request)
    .receive(on: DispatchQueue.main)
    .sink { response in
        switch response {
        case let .failure(error):
            print(error)
        case .finished:
            print("Contentful Articles loaded")
        }
    } receiveValue: { response in
        self.contentfulArticles = response
    }
    .store(in: &cancellables)
```

Developed by: **Torben Köhler**
