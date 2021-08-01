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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: dateString) {
            self = date
        } else {
            return nil
        }
    }
}
