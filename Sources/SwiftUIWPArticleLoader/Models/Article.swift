//
//  Article.swift
//  
//
//  Created by Torben Köhler on 10.06.21.
//

import Foundation

struct Article: Identifiable {
    // MARK: Top Data
    /// Unique identifier for the article.
    let id: Int
    ///The date the article was published, in your timezone.
    let date: Date?
    /// The globally unique identifier for the article.
    let guid: Content
    /// URL to the article.
    let link: URL
    /// The date the article was last modified, in the your timezone.
    let modified: Date?
    /// An alphanumeric identifier for the article unique to its type.
    let slug: String
    /// Status for the article.
    let status: PublishStatus
    /// Type of Post for the article.
    let type: String
    /// The title for the article.
    let title: String
    /// The format for the article.
    let format: Format

    // MARK: Settings
    /// Whether or not comments are open on the article.
    let commentStatus: FeatureStatus
    /// Whether or not the article can be pinged.
    let pingStatus: FeatureStatus

    // MARK: Content
    /// The content for the article.
    let content: Content
    /// The excerpt for the article.
    let excerpt: Content
    /// The featured image for the article.
    let featuredImageLoader: ImageLoader?


    // MARK: EmbeddedData
    let author: User
    let categories: [Term]
    let tags: [Term]

    @available(macOS 10.12, *)
    init(from contentful: ContentfulArticle) {
        id = contentful.id
        date = contentful.date?.gmtToLocal()
        guid = contentful.guid
        link = contentful.link
        modified = contentful.modified?.gmtToLocal()
        slug = contentful.slug
        status = contentful.status
        type = contentful.type
        title = contentful.title.rendered
        format = contentful.format
        commentStatus = contentful.commentStatus
        pingStatus = contentful.pingStatus
        content = contentful.content
        excerpt = contentful.excerpt
        author = User(from: contentful.embeddedData.author)
        if let link = contentful.embeddedData.featuredMedia.first(where: {
            $0.id == contentful.featuredMediaID
        })?.link {
            featuredImageLoader = ImageLoader(url: link)
        } else {
            featuredImageLoader = nil
        }
        categories = contentful.embeddedData.terms.compactMap({ return $0.type == .category ? $0 : nil })
        tags = contentful.embeddedData.terms.compactMap({ return $0.type == .tag ? $0 : nil })
    }
}
