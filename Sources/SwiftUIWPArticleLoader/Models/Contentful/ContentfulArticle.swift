//
//  ContentfulArticle.swift
//  
//
//  Created by Torben Köhler on 26.07.21.
//

import Foundation

@available(macOS 10.12, *)
public struct ContentfulArticle: Decodable, Identifiable {
    // MARK: Top Data
    /// Unique identifier for the object.
    public let id: Int
    ///The date the object was published, in the site's timezone.
    public let date: Date?
    /// The date the object was published, as GMT.
    public let dateGMT: Date?
    /// The globally unique identifier for the object.
    let guid: ContentfulContent
    /// URL to the object.
    public let link: URL
    /// The date the object was last modified, in the site's timezone.
    public let modified: Date?
    /// The date the object was last modified, as GMT.
    public let modifiedGMT: Date?
    /// An alphanumeric identifier for the object unique to its type.
    public let slug: String
    /// Status for the object.
    public let status: PublishStatus
    /// Type of Post for the object.
    public let type: String
    /// The title for the object.
    let title: ContentfulContent
    /// The format for the object.
    public let format: Format
    // MARK: Settings
    /// Whether or not comments are open on the object.
    public let commentStatus: FeatureStatus
    /// Whether or not the object can be pinged.
    public let pingStatus: FeatureStatus
    // MARK: Content
    /// The content for the object.
    let content: ContentfulContent
    /// The excerpt for the object.
    let excerpt: ContentfulContent
    /// The ID of the featured media for the object.
    public let featuredMediaID: Int
    // MARK: EmbeddedData
    /// Other Data that is embedded
    public let embeddedData: EmbeddedData
    public struct EmbeddedData: Decodable {
        public let author: ContentfulUser
        public let featuredMedia: [ContentfulMedia]?
        public let terms: [ContentfulTag]?

        enum CodingKeys: String, CodingKey {
            case author
            case featuredMedia = "wp:featuredmedia"
            case terms = "wp:term"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            author = try container.decode([ContentfulUser].self, forKey: .author).first!
            featuredMedia = try? container.decode([ContentfulMedia].self, forKey: .featuredMedia)
            if let termsFetch = try? container.decode([[ContentfulTag]].self, forKey: .terms) {
                terms = Array(termsFetch.joined())
            } else { terms = nil }
        }
    }
    // MARK: Decodable
    enum CodingKeys: String, CodingKey {
        case dateGMT = "date_gmt"
        case modifiedGMT = "modified_gmt"
        case commentStatus = "comment_status"
        case pingStatus = "ping_status"
        case embeddedData = "_embedded"
        case featuredMediaID = "featured_media"
        case id, date, guid, link, modified, slug, status, type, title, format, content, excerpt
    }
    // MARK: init
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        date = Date(wpFormatString: try container.decode(String.self, forKey: .date))
        dateGMT = Date(wpFormatString: try container.decode(String.self, forKey: .dateGMT))
        guid = try container.decode(ContentfulContent.self, forKey: .guid)
        link = try container.decode(URL.self, forKey: .link)
        modified = Date(wpFormatString: try container.decode(String.self, forKey: .modified))
        modifiedGMT = Date(wpFormatString: try container.decode(String.self, forKey: .modifiedGMT))
        slug = try container.decode(String.self, forKey: .slug)
        status = try container.decode(PublishStatus.self, forKey: .status)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decode(ContentfulContent.self, forKey: .title)
        format = try container.decode(Format.self, forKey: .format)
        commentStatus = try container.decode(FeatureStatus.self, forKey: .commentStatus)
        pingStatus = try container.decode(FeatureStatus.self, forKey: .pingStatus)
        content = try container.decode(ContentfulContent.self, forKey: .content)
        excerpt = try container.decode(ContentfulContent.self, forKey: .excerpt)
        featuredMediaID = try container.decode(Int.self, forKey: .featuredMediaID)
        embeddedData = try container.decode(EmbeddedData.self, forKey: .embeddedData)
    }
}
