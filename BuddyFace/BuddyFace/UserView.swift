//
//  UserView.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-03.
//

import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.largeTitle)
                
                Text("\(user.age)")
                    .font(.headline)
            }
            
            VStack(alignment: .leading) {
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
                Text("Registered Date: \(registeredDate(user.registered).formatted(date: .abbreviated, time: .omitted))")
            }
            
            Text("About: \(user.about)")
            
            Text("Friends: \(combineFriendText(user.friends))")
            
            Text("Tags: \(user.tags.joined(separator: ", "))")
        }
        .navigationTitle("\(user.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func registeredDate(_ date: String) -> Date {
        let regDate = ISO8601DateFormatter().date(from: date)
        return regDate ?? Date.now
    }
    
    func combineFriendText(_ array: [Friend]) -> String {
        var combinedText = ""
        
        for i in 0..<array.count {
            combinedText += array[i].name + (i == array.count - 1 ? "" : ", ")
        }
        
        return combinedText
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
