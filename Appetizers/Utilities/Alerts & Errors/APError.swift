//
//  APError.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import Foundation

///Used first two letter of Appetizer Error to abbreviate here.
enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
