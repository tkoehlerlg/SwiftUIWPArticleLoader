//
//  User.swift
//
//
//  Created by Torben Köhler on 30.07.21.
//

import Foundation

public class User: Identifiable {
    /// Unique identifier for the user.
    public let id: Int
    /// Display name for the user.
    public let name: String
    /// URL of the user.
    public let url: URL?
    /// Description of the user.
    public let description: String?
    /// Author URL of the user.
    public let link: URL
    /// An alphanumeric identifier for the user.
    public let slug: String
    #if !os(macOS)
    /// Avatar Image for the user.
    public let profileImageLoader: ImageLoader?
    #endif
    // MARK: init
    init(from contentful: ContentfulUser) {
        id = contentful.id
        name = contentful.name
        url = contentful.url
        description = contentful.description
        link = contentful.link
        slug = contentful.slug
        #if !os(macOS)
        profileImageLoader = ImageLoader(url: contentful.avatarURLs.high)
        #endif
    }
    //MARK: mock
    private init() {
        id = 0
        name = "Torben Köhler"
        url = URL(staticString: "https://ml-projects.de/")
        description = "Developer"
        link = URL(staticString: "https://ml-projects.de/ueber-uns/")
        slug = "torben"
        #if !os(macOS)
        profileImageLoader = ImageLoader(
            url: URL(staticString: "https://salz-app.de/wp-content/uploads/2021/03/IMG_4559-scaled.jpeg")
        )
        #endif
    }
    static var mock: User = .init()
}
