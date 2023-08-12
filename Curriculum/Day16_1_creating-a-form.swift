//
//  ContentView.swift
//  WeSplit
//
//  Created by Alex Nguyen on 2023-04-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Group {
                Text("This is Canada")
                Text("This is Canada")
                Text("This is Canada")
                Text("This is Canada")
                Text("This is Canada")
                Section {
                    Text("We are Toronto")
                    Text("We are Toronto")
                    Text("We are Toronto")
                    Text("We are Toronto")
                    Text("We are Toronto")
                }
            }
            Section {
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
            }
            Section {
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
                Text("Hey, yo! What's up?")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
