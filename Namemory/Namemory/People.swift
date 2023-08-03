//
//  People.swift
//  Namemory
//
//  Created by Alex Nguyen on 2023-08-03.
//

import SwiftUI

struct Person: Identifiable {
    let id: UUID
    var name: String
    var image: Image
        
    static let example = Person(id: UUID(), name: "John Doe", image: Image(systemName: "person"))
}

class ContactBook: ObservableObject {
    @Published var people = [Person]()
    
    init() {
        people = []
    }
    
    static let example = ContactBook()
}
