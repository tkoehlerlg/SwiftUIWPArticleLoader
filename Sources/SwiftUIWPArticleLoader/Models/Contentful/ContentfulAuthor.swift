//
//  ContentfulAuthor.swift
//  
//
//  Created by Torben Köhler on 30.07.21.
//

import Foundation

struct ContentfulAuthor: Decodable {
    let id: Int
    let name: String
    let url: URL
    let description: String
    let link: URL
    let slug: String
    let avatarURLs: AvatarURLs

    enum CodingKeys: String, CodingKey {
        case avatar = "avatar_urls"
        case id, name, url, description, link, slug, profileImageLink
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        url  =  try container.decode(URL.self, forKey: .url)
        description = try container.decode(String.self, forKey: .description)
        link = try container.decode(URL.self, forKey: .link)
        slug = try container.decode(String.self, forKey: .slug)
        avatar = try container.decode(AvatarURLs.self, forKey: .avatar)
    }
}
