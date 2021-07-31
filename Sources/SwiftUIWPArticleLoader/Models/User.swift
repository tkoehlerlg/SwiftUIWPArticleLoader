//
//  User.swift
//
//
//  Created by Torben Köhler on 30.07.21.
//

import Foundation

class User: Identifiable {
    /// Unique identifier for the user.
    let id: Int
    /// Display name for the user.
    let name: String
    /// URL of the user.
    let url: URL
    /// Description of the user.
    let description: String
    /// Author URL of the user.
    let link: URL
    /// An alphanumeric identifier for the user.
    let slug: String
    /// Avatar Image for the user.
    let profileImageLoader: ImageLoader?

    init(from contentful: ContentfulUser) {
        self.id = id
        self.name = name
        self.url = url
        self.description = description
        self.link = link
        self.slug = slug
        profileImageLoader = ImageLoader(url: contentful.avatarURLs.high)
    }
}
