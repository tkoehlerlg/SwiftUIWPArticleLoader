import XCTest
import Combine
@testable import SwiftUIWPArticleLoader

final class SwiftUIWPArticleLoaderTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []

    func testFetch() {
        let loader = WPArticleLoader(websiteAdress: URL(staticString: "https://eierml.ml-projects.de"))
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

    func testJSONDecoding() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        guard let data = testJSON.data(using: .utf8) else { return }
        do {
            let articles = try decoder.decode([ContentfulArticle].self, from: data)
            XCTAssertNotNil(articles.first)
        }  catch DecodingError.dataCorrupted(let context) {
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
    }
}
