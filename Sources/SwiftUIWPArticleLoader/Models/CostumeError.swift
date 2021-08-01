//
//  CostumeError.swift
//  
//
//  Created by Torben Köhler on 25.07.21.
//

import Foundation

enum WPError: Error {
    /// Throw when an invalid url is entered
    public case urlError
    /// Throw when an url resource is not found
    public case resourceNotFound
}
