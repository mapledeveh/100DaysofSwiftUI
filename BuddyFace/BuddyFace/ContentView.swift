//
//  ContentView.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-03.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    let columns = [ GridItem(.adaptive(minimum: .infinity)) ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink {
                        UserView(user: user)
                    } label: {
                        Text(user.name)
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
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
