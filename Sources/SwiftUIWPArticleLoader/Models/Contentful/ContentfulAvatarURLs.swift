//
//  ContentfulAvatarURLs.swift
//  
//
//  Created by Torben Köhler on 30.07.21.
//

import Foundation

class ContentfulAvatarURLs: Decodable {
    /// 24
    let small: URL
    /// 48
    let medium: URL
    /// 96
    let high: URL

    enum CodingKeys: String, CodingKey {
        case small = "24"
        case medium = "48"
        case hight = "96"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(URL.self, forKey: .small)
        medium = try container.decode(URL.self, forKey: .medium)
        high  =  try container.decode(URL.self, forKey: .hight)
    }
}

