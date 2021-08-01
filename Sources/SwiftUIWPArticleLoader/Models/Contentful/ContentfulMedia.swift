//
//  ContentfulMedia.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Foundation

struct ContentfulMedia: Codable {
    /// Unique identifier for the object.
    let id: Int
    /// The date the object was published, in the site's timezone.
    let date: String
    /// The date the object was published, as GMT.
    let dateGMT: String
    /// URL to the object.
    let link: URL
    /// The date the object was last modified, in the site's timezone.
    let modified: Date
    /// The date the object was last modified, as GMT.
    let modifiedGMT: Date
    /// An alphanumeric identifier for the object unique to its type.
    let slug: String
    /// Status for the object.
    let status: PublishStatus
    /// Type of Post for the object.
    let type: String
    /// The title for the object.
    let title: Content
    /// The ID for the author of the object.
    let author: Int
    /// Whether or not comments are open on the object.
    let commentStatus: FeatureStatus
    /// Whether or not the object can be pinged.
    let pingStatus: FeatureStatus
    /// The attachment description.
    let description: Content
    /// Attachment type.
    let mediaType: MediaType
    enum MediaType: String, Codable {
        case image, file
    }
    /// The attachment MIME type.
    let mimeType: String
    /// URL to the original attachment file.
    let sourceURL: URL
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case dateGMT = "dategmt"
        case modifiedGMT = "modifiedgmt"
        case commentStatus = "commentstatus"
        case pingStatus = "pingstatus"
        case mediaType = "mediatype"
        case mimeType = "mimetype"
        case sourceURL = "sourceurl"
        case id, date, link, modified, slug, status, type, title, author, description
    }
}
