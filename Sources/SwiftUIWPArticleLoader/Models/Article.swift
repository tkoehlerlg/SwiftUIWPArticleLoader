//
//  Article.swift
//  Clickbait ML Multi
//
//  Created by Torben Köhler on 10.06.21.
//

import SwiftUI

struct Article: Codable, Identifiable {
    let id: Int
    let date: String
    let title: Content
    let link: String
    let categories: [Int]
    let type: String
    let status: String

    var dateText: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: date) else { return nil }
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Heute"
        } else if calendar.isDateInToday(date) {
            return "Gestern"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "d e yyyy"
            formatter.doesRelativeDateFormatting = true
            return formatter.string(from: date)
        }
    }

    static var mock: Self = .init(
        id: 0,
        date: "2021-04-16T21:55:50",
        title: Content(rendered: "Test Title"),
        link: "https://google.de",
        categories: [],
        type: "Post",
        status: "open"
    )
}

struct Content: Codable {
    let rendered: String
}
