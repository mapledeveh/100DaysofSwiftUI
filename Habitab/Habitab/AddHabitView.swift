//
//  AddHabitView.swift
//  Habitab
//
//  Created by Alex Nguyen on 2023-06-06.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var description = ""
    @State private var showEmptyAlert = false
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Title", text: $name)
                    
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Add A Habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !name.isEmpty && !description.isEmpty {
                            habits.activities.append(HabitItem(name: name, description: description))
                            dismiss()
                        } else {
                            showEmptyAlert = true
                        }
                    }
                    .alert("Error", isPresented: $showEmptyAlert) {
                        Button("Alright") { }
                    } message: {
                        Text("All fields must be filled out.")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
