//
//  ContentView.swift
//  Habitab
//
//  Created by Alex Nguyen on 2023-06-05.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddHabit = false
    
    @StateObject var habits = Habits()
    
    func deleteRow(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .red]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack {
                    List {
                        ForEach(habits.activities, id: \.id) { habit in
                            NavigationLink {
                                HabitView(habit: habit, habits: habits)
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(habit.name)")
                                            .font(.headline)
                                        
                                        Text("\(habit.description)")
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(habit.count)")
                                }
                            }
                        }
                        .onDelete(perform: deleteRow)
                    }
                    .listStyle(.plain)
                    .padding()
                    
                    Button {
                        showingAddHabit = true
                        //                    let habit = HabitItem(name: "Test", description: "Waste of money and time")
                        //                    habits.items.append(habit)
                    } label: {
                        Text("Add Habit")
                            .frame(maxWidth: 250, maxHeight: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                    }
                    .sheet(isPresented: $showingAddHabit) {
                        AddHabitView(habits: habits)
                    }
                }
                .navigationTitle("Habitab")
                .background(.thinMaterial)
                .toolbar {
                    EditButton()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
