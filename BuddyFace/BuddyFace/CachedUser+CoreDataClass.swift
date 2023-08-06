//
//  CachedUser+CoreDataClass.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-04.
//
//

import Foundation
import CoreData

@objc(CachedUser)

public class CachedUser: NSManagedObject {

}
//public class CachedUser: NSManagedObject, Codable {
//    enum CodingKeys: CodingKey {
//        case id, name, age, company, email, address, tags, about, isActive, registered
//    }
//
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(age, forKey: .age)
//        try container.encode(company, forKey: .company)
//        try container.encode(email, forKey: .email)
//        try container.encode(address, forKey: .address)
//        try container.encode(about, forKey: .about)
//        try container.encode(tags, forKey: .tags)
//        try container.encode(isActive, forKey: .isActive)
//        try container.encode(registered, forKey: .registered)
//    }
//
//    required public convenience init(from decoder: Decoder) throws {
//        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
//            throw ContextError.NoContextFound
//        }
//
//        self.init(context: context)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decode(UUID.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        age = try container.decode(Int16.self, forKey: .age)
//        company = try container.decode(String.self, forKey: .company)
//        email = try container.decode(String.self, forKey: .email)
//        address = try container.decode(String.self, forKey: .address)
//        about = try container.decode(String.self, forKey: .about)
//        tags = try container.decode(String.self, forKey: .tags)
//        isActive = try container.decode(Bool.self, forKey: .isActive)
//        registered = try container.decode(Date.self, forKey: .registered)
//    }
//}
//
//extension CodingUserInfoKey {
//    static let context = CodingUserInfoKey(rawValue: "managedObjectContext")!
//}
//
//
//enum ContextError: Error {
//    case NoContextFound
//}
