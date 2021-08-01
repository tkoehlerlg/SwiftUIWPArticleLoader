//
//  Category.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 30.06.21.
//

import Foundation

class Term: Identifiable {
    /// Unique identifier for the term.
    public let id: String
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
        id: String,
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
}
