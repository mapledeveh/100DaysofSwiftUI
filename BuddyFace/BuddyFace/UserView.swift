//
//  UserView.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-03.
//

import SwiftUI

struct UserView: View {
    var user: CachedUser
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(user.wrappedName)
                    .font(.largeTitle)
                
                Text("\(user.age)")
                    .font(.headline)
            }
            
            VStack(alignment: .leading) {
                Text("Email: \(user.wrappedEmail)")
                Text("Address: \(user.wrappedAddress)")
                Text("Company: \(user.wrappedCompany)")
                Text("Registered Date: \(user.wrappedRegistered.formatted(date: .abbreviated, time: .omitted))")
            }
            
            Text("About: \(user.wrappedAbout)")
            
            Text("Friends: \(user.wrappedFriends)")
            
            Text("Tags: \(user.wrappedTags)")
        }
        .navigationTitle("\(user.wrappedName)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func registeredDate(_ date: String) -> Date {
        let regDate = ISO8601DateFormatter().date(from: date)
        return regDate ?? Date.now
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
