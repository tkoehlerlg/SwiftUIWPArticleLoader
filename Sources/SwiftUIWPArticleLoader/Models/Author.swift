//
//  Author.swift
//
//
//  Created by Torben Köhler on 30.07.21.
//

struct Author: Codable {
    let id: Int
    let link: String
    let name: String
    let description: String
    let profileImageLink: String

    static var mock: Self = .init(
        id: 0,
        link: "",
        name: "",
        description: "",
        profileImageLink: ""
    )
}

