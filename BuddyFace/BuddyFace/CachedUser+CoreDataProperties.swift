//
//  CachedUser+CoreDataProperties.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-04.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var tags: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown"
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown"
    }
    
    public var wrappedTags: String {
        tags ?? "Unknown"
    }
    
    public var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    public var wrappedFriends: String {
        var combinedFriends = [String]()
        
        Array(friends as? Set<CachedFriend> ?? []).forEach { friend in
            combinedFriends.append(friend.wrappedName)
        }
        
        return combinedFriends.joined(separator: ", ")
    }
    
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
