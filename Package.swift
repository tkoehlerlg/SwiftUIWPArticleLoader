// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftUIWPArticleLoader",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SwiftUIWPArticleLoader",
            targets: ["SwiftUIWPArticleLoader"]),
    ],
    targets: [
        .target(
            name: "SwiftUIWPArticleLoader",
            dependencies: []),
        .testTarget(
            name: "SwiftUIWPArticleLoaderTests",
            dependencies: ["SwiftUIWPArticleLoader"]),
    ]
)
