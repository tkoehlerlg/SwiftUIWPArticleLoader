//
//  Tag.swift
//
//
//  Created by Torben Köhler on 30.06.21.
//

import Foundation

public class Tag: Identifiable {
    /// Unique identifier for the term.
    public let id: Int
    /// HTML description of the term.
    public let description: String?
    /// URL of the term.
    public let link: URL
    /// HTML title for the term.
    public let name: String
    /// An alphanumeric identifier for the term unique to its type.
    public let slug: String
    // MARK: init
    init(
        id: Int,
        description: String?,
        link: URL,
        name: String,
        slug: String
    ) {
        self.id = id
        self.description = description
        self.link = link
        self.name = name
        self.slug = slug
    }
    //MARK: mock
    static var mockCategory: Tag = .init(
        id: 0,
        description: "A Category.",
        link: URL(staticString: "https://ml-projects.de/blog/"),
        name: "Category",
        slug: "category"
    )
    static var mockTag: Tag = .init(
        id: 0,
        description: "A Tag.",
        link: URL(staticString: "https://ml-projects.de/blog/"),
        name: "Tag",
        slug: "tag"
    )
}
