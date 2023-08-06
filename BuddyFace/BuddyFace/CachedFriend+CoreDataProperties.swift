//
//  CachedFriend+CoreDataProperties.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-04.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    public var wrappedName: String {
        name ?? "Unknown"
    }

}

extension CachedFriend : Identifiable {

}
