//
//  Date+WPFormat.swift
//  
//
//  Created by Torben Köhler on 31.07.21.
//

import Foundation

extension Date {
    @available(macOS 10.12, *)
    init?(wpFormatString: String) {
        let formater = ISO8601DateFormatter()
        if let date = formater.date(from: wpFormatString) {
            self = date
        } else {
            return nil
        }
    }
}
