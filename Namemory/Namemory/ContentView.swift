//
//  ContentView.swift
//  Namemory
//
//  Created by Alex Nguyen on 2023-08-02.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddPerson = false
    @StateObject var contactBook = ContactBook()
    @State private var person = [Person]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contactBook.people) { person in
                    HStack {
                        person.image
                            .resizable()
                            .scaledToFit()
                        
                        Text(person.name)
                    }
                }
            }
            .navigationTitle("People")
            .toolbar {
                Button {
                    showingAddPerson = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddPerson) {
                AddPersonView(contactBook: contactBook)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
