//
//  ContentView.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-03.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    @State private var users = [User]()
    @State private var switchView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cachedUsers, id: \.id) { user in
                    NavigationLink {
                        UserView(user: user)
                    } label: {
                        Text(user.wrappedName)
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle("BuddyFace")
        }
        .task {
            await loadData()
            
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Error while loading URL!")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            let decodedResponse = try decoder.decode([User].self, from: data)
            users = decodedResponse
            
//            decoder.userInfo[.context] = moc
//            let decodedResponse = try decoder.decode([CachedUser].self, from: data)
//            decodedResponse.forEach { person in
//                print(person.tags)
//            }
//
//            if moc.hasChanges {
//                try moc.save()
//            }
            
        } catch {
            print("\(error.localizedDescription)")
        }
        
        await MainActor.run {
            users.forEach { user in
                let cachedUser = CachedUser(context: moc)
                cachedUser.id = user.id
                cachedUser.name = user.name
                cachedUser.age = Int16(user.age)
                cachedUser.company = user.company
                cachedUser.email = user.email
                cachedUser.address = user.address
                cachedUser.about = user.about
                cachedUser.isActive = user.isActive
                cachedUser.registered = ISO8601DateFormatter().date(from: user.registered)
                cachedUser.tags = user.tags.joined(separator: ", ")
                user.friends.forEach { friend in
                    let cachedFriend = CachedFriend(context: moc)
                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name
                    
                    cachedUser.addToFriends(cachedFriend)
                }
            }

//            if moc.hasChanges {
//                try? moc.save()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
