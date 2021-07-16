//
//  User.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 6/2/21.
//

import Foundation

struct User: Codable {
    var firstName                   = ""
    var lastName                    = ""
    var email                       = ""
    var birthday                    = Date()
    var extraNapkins                = false
    var frequentRefills             = true
}
