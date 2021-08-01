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
    /// URL of the term.
    public let link: URL
    /// HTML title for the term.
    public let name: String
    /// An alphanumeric identifier for the term unique to its type.
    public let slug: String
    // MARK: init
    init(
        id: Int,
        link: URL,
        name: String,
        slug: String
    ) {
        self.id = id
        self.link = link
        self.name = name
        self.slug = slug
    }
}
