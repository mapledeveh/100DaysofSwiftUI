//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Alex Nguyen on 2023-07-03.
//

import SwiftUI
import CoreData

//struct FilteredList: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
//        List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
//    init(filter: String) {
//        _fetchRequest = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
