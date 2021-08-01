//
//  ContentfulTerm.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Foundation

class ContentfulTerm: Term, Decodable {
    /// What Type the Term is.
    let type: TermType
    enum TermType: String, Codable {
        case navMenu = "nav_menu"
        case linkCategory = "link_category"
        case postFormat = "post_format"
        case postTag = "post_tag"
        case category
    }
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case type = "taxonomy"
        case id, description, link, name, slug
    }
    // MARK: init
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let description = try? container.decode(String.self, forKey: .description)
        let link = try container.decode(URL.self, forKey: .link)
        let name = try container.decode(String.self, forKey: .name)
        let slug = try container.decode(String.self, forKey: .slug)
        type = try container.decode(TermType.self, forKey: .type)
        super.init(
            id: id,
            description: description,
            link: link,
            name: name,
            slug: slug
        )
    }
}
