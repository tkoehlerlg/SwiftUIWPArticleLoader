//
//  PublishStatus.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Foundation

enum PublishStatus: String, Codable {
    public case publish, future, draft, pending, `private`
}
