//
//  ContentfulUser.swift
//  
//
//  Created by Torben Köhler on 30.07.21.
//

import Foundation

class ContentfulUser: Decodable {
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
    /// Avatar URLs for the user.
    let avatarURLs: ContentfulAvatarURLs
    //MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case avatarURLs = "avatarurls"
        case id, name, url, description, link, slug
    }
    // MARK: init
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        url  =  try container.decode(URL.self, forKey: .url)
        description = try container.decode(String.self, forKey: .description)
        link = try container.decode(URL.self, forKey: .link)
        slug = try container.decode(String.self, forKey: .slug)
        avatarURLs = try container.decode(ContentfulAvatarURLs.self, forKey: .avatarURLs)
    }
}
