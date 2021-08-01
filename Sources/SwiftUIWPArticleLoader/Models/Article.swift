//
//  Article.swift
//  
//
//  Created by Torben Köhler on 10.06.21.
//

import Foundation

public struct Article: Identifiable {
    // MARK: Top Data
    /// Unique identifier for the article.
    public let id: Int
    ///The date the article was published, in your timezone.
    public let date: Date?
    /// The globally unique identifier for the article.
    public let guid: String
    /// URL to the article.
    public let link: URL
    /// The date the article was last modified, in the your timezone.
    public let modified: Date?
    /// An alphanumeric identifier for the article unique to its type.
    public let slug: String
    /// Status for the article.
    public let status: PublishStatus
    /// Type of Post for the article.
    public let type: String
    /// The title for the article.
    public let title: String
    /// The format for the article.
    public let format: Format
    // MARK: Settings
    /// Whether or not comments are open on the article.
    public let commentStatus: FeatureStatus
    /// Whether or not the article can be pinged.
    public let pingStatus: FeatureStatus
    // MARK: Content
    /// The content for the article.
    public let content: String
    /// The excerpt for the article.
    public let excerpt: String
    #if !os(macOS)
    /// The featured image for the article.
    public let featuredImageLoader: ImageLoader?
    #endif
    // MARK: EmbeddedData
    public let author: User
    public let categories: [Tag]
    public let tags: [Tag]
    //MARK: init
    @available(macOS 10.12, *)
    init(from contentful: ContentfulArticle) {
        id = contentful.id
        date = contentful.date?.gmtToLocal()
        guid = contentful.guid.rendered
        link = contentful.link
        modified = contentful.modified?.gmtToLocal()
        slug = contentful.slug
        status = contentful.status
        type = contentful.type
        title = contentful.title.rendered
        format = contentful.format
        commentStatus = contentful.commentStatus
        pingStatus = contentful.pingStatus
        content = contentful.content.rendered
        excerpt = contentful.excerpt.rendered
        author = User(from: contentful.embeddedData.author)
        #if !os(macOS)
        if let link = contentful.embeddedData.featuredMedia.first(where: {
            $0.id == contentful.featuredMediaID
        })?.link {
            featuredImageLoader = ImageLoader(url: link)
        } else {
            featuredImageLoader = nil
        }
        #endif
        categories = contentful.embeddedData.terms.compactMap({ return $0.type == .category ? $0 : nil })
        tags = contentful.embeddedData.terms.compactMap({ return $0.type == .postTag ? $0 : nil })
    }
    // MARK: mock
    private init() {
        id = 0
        date = Date()
        guid = "guid"
        link = URL(staticString: "https://wordpress.org")
        modified = Date()
        slug = "slug"
        status = .publish
        type = "post"
        title = "Title"
        format = .standard
        commentStatus = .closed
        pingStatus = .closed
        content = "<p>Content</p>"
        excerpt = "<p>Cont...</p>"
        author = .mock
        #if !os(macOS)
        featuredImageLoader = ImageLoader(
            url: URL(staticString: "https://s.w.org/images/home/swag_col-1.jpg?1")
        )
        #endif
        categories = [.mockCategory]
        tags = [.mockTag]
    }
    public static var mock: Self = .init()
}
