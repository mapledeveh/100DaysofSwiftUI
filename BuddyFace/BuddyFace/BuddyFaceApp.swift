//
//  BuddyFaceApp.swift
//  BuddyFace
//
//  Created by Alex Nguyen on 2023-07-03.
//

import SwiftUI

@main
struct BuddyFaceApp: App {
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
