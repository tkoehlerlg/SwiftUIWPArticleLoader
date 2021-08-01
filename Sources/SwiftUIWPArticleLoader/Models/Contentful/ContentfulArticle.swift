//
//  ContentfulArticle.swift
//  
//
//  Created by Torben Köhler on 26.07.21.
//

import Foundation

@available(macOS 10.12, *)
struct ContentfulArticle: Decodable, Identifiable {
    // MARK: Top Data
    /// Unique identifier for the object.
    let id: Int
    ///The date the object was published, in the site's timezone.
    let date: Date?
    /// The date the object was published, as GMT.
    let dateGMT: Date?
    /// The globally unique identifier for the object.
    let guid: Content
    /// URL to the object.
    let link: URL
    /// The date the object was last modified, in the site's timezone.
    let modified: Date?
    /// The date the object was last modified, as GMT.
    let modifiedGMT: Date?
    /// An alphanumeric identifier for the object unique to its type.
    let slug: String
    /// Status for the object.
    let status: PublishStatus
    /// Type of Post for the object.
    let type: String
    /// The title for the object.
    let title: Content
    /// The format for the object.
    let format: Format
    // MARK: Settings
    /// Whether or not comments are open on the object.
    let commentStatus: FeatureStatus
    /// Whether or not the object can be pinged.
    let pingStatus: FeatureStatus

    // MARK: Content
    /// The content for the object.
    let content: Content
    /// The excerpt for the object.
    let excerpt: Content
    /// The ID of the featured media for the object.
    let featuredMediaID: Int
    // MARK: EmbeddedData
    /// Other Data that is embedded
    let embeddedData: EmbeddedData
    struct EmbeddedData: Decodable {
        let author: ContentfulUser
        let featuredMedia: [ContentfulMedia]
        let terms: [ContentfulTerm]

        enum CodingKeys: String, CodingKey {
            case featuredMedia = "wp:featuredmedia"
            case terms = "wp:term"
            case author
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            author = try container.decode([ContentfulUser].self, forKey: .author).first!
            terms = Array(try container.decode([[ContentfulTerm]].self, forKey: .terms).joined())
            featuredMedia = try container.decode([ContentfulMedia].self, forKey: .featuredMedia)
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
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        date = try Date(wpFormatString: container.decode(String.self, forKey: .date))
        dateGMT = try Date(wpFormatString: container.decode(String.self, forKey: .dateGMT))
        guid = try container.decode(Content.self, forKey: .guid)
        link = try container.decode(URL.self, forKey: .link)
        modified = try Date(wpFormatString: container.decode(String.self, forKey: .modified))
        modifiedGMT = try Date(wpFormatString: container.decode(String.self, forKey: .modifiedGMT))
        slug = try container.decode(String.self, forKey: .slug)
        status = try container.decode(PublishStatus.self, forKey: .status)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decode(Content.self, forKey: .content)
        format = try container.decode(Format.self, forKey: .format)
        commentStatus = try container.decode(FeatureStatus.self, forKey: .commentStatus)
        pingStatus = try container.decode(FeatureStatus.self, forKey: .pingStatus)
        content = try container.decode(Content.self, forKey: .content)
        excerpt = try container.decode(Content.self, forKey: .excerpt)
        featuredMediaID = try container.decode(Int.self, forKey: .featuredMediaID)
        embeddedData = try container.decode(EmbeddedData.self, forKey: .embeddedData)
    }
}
