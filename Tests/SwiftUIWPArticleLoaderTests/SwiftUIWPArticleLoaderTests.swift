    import XCTest
    import Combine
    @testable import SwiftUIWPArticleLoader

    final class SwiftUIWPArticleLoaderTests: XCTestCase {
        private var cancellables: Set<AnyCancellable> = []
        let loader = WPArticleLoader(websiteAdress: "https://clickbaitml.de")

        func testExample() {
            loader.fetchArticles()
                .receive(on: DispatchQueue.main)
                .sink { response in
                    switch response {
                    case let .failure(error):
                        print("failed", error, error.localizedDescription)
                        XCTAssertTrue(false)
                    case .finished:
                        print("received Articles")
                        XCTAssertTrue(true)
                    }
                } receiveValue: { response in
                    print("\(response) Article were found")
                }
                .store(in: &cancellables)
        }
    }
