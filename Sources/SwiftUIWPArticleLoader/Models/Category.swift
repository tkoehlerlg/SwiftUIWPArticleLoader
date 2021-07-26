//
//  Category.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 30.06.21.
//

import Foundation

struct Category: Codable {
    let id: Int
    let name: String

    static var mock: Self = .init(
        id: 0,
        name: "Test Category"
    )
}