//
//  ContentfulMedia.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Foundation

public struct ContentfulMedia: Decodable {
    /// Unique identifier for the object.
    public let id: Int
    /// The date the object was published, in the site's timezone.
    public let date: String
    /// URL to the object.
    public let link: URL
    /// An alphanumeric identifier for the object unique to its type.
    public let slug: String
    /// Type of Post for the object.
    public let type: String
    /// The title for the object.
    public let title: Content
    /// The ID for the author of the object.
    public let authorID: Int
    /// The attachment description.
    public let description: Content?
    /// Attachment type.
    public let mediaType: MediaType
    public enum MediaType: String, Codable {
        case image, file
    }
    /// The attachment MIME type.
    public let mimeType: String
    /// URL to the original attachment file.
    public let sourceURL: URL
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case authorID = "author"
        case sourceURL = "source_url"
        case mediaType = "media_type"
        case mimeType = "mime_type"
        case id, date, link, slug, type, title, description
    }
    // MARK: init
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        date = try container.decode(String.self, forKey: .date)
        link = try container.decode(URL.self, forKey: .link)
        slug = try container.decode(String.self, forKey: .slug)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decode(Content.self, forKey: .title)
        authorID = try container.decode(Int.self, forKey: .authorID)
        description = try? container.decode(Content.self, forKey: .description)
        mediaType = try container.decode(MediaType.self, forKey: .mediaType)
        mimeType = try container.decode(String.self, forKey: .mimeType)
        sourceURL = try container.decode(URL.self, forKey: .sourceURL)
    }
}
