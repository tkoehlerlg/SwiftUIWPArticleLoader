import Foundation

public extension URL {
    /// Use this initializer for hard-coded URL strings.
    init(staticString: String) {
        self = URL(string: staticString)!
    }
}
