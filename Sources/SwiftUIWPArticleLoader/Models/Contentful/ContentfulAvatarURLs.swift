//
//  ContentfulAvatarURLs.swift
//  
//
//  Created by Torben Köhler on 30.07.21.
//

import Foundation

public class ContentfulAvatarURLs: Decodable {
    /// 24
    public let small: URL
    /// 48
    public let medium: URL
    /// 96
    public let high: URL
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case small = "24"
        case medium = "48"
        case hight = "96"
    }
    // MARK: init
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(URL.self, forKey: .small)
        medium = try container.decode(URL.self, forKey: .medium)
        high  =  try container.decode(URL.self, forKey: .hight)
    }
}

