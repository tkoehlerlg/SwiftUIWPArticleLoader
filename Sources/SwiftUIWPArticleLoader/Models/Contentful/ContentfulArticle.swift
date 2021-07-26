//
//  ContentfulArticle.swift
//  
//
//  Created by Torben Köhler on 26.07.21.
//

import Foundation

struct ContentfulArticle: Codable, Identifiable {
    let id: Int
    let date: String
    let title: Content
    let link: String
    let categories: [Int]
    let type: String
    let status: String
}
