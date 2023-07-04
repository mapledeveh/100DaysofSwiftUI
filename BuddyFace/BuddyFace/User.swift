//
//  User.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-03.
//

import Foundation

struct Friend: Codable {
    var id: UUID
    var name: String
}

struct User: Codable {
    var id: UUID
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var tags: [String]
    var friends: [Friend]
    var isActive: Bool
    var registered: String
}
