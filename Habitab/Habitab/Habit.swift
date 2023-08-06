//
//  Habit.swift
//  Habitab
//
//  Created by Alex Nguyen on 2023-06-06.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var count = 1
}

class Habits: ObservableObject {
    @Published var activities = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItem = try? JSONDecoder().decode([HabitItem].self, from: savedItem) {
                activities = decodedItem
                return
            }
        }
        
        activities = []
    }
}
