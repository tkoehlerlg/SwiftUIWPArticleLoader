//
//  Category.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 30.06.21.
//

import Foundation

class Term: Identifiable {
    /// Unique identifier for the term.
    let id: String
    /// HTML description of the term.
    let description: String?
    /// URL of the term.
    let link: URL
    /// HTML title for the term.
    let name: String
    /// An alphanumeric identifier for the term unique to its type.
    let slug: String

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
