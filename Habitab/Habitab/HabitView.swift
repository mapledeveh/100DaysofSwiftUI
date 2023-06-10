//
//  HabitView.swift
//  Habitab
//
//  Created by Alex Nguyen on 2023-06-08.
//

import SwiftUI

struct HabitView: View {
    @State var habit: HabitItem
    @ObservedObject var habits: Habits
        
    func completionCount() {
        if let index = habits.activities.firstIndex(of: habit) {
            habit.count += 1
            habits.activities[index] = habit
        }
    }
            
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .red]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .frame(height: 400)
                            .background(.thinMaterial)
                            .opacity(0.75)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack {
                            Text("\(habit.name)")
                                .font(.largeTitle)
                            
                            Text("\(habit.description)")
                            
                            
                            VStack {
                                Text("\(habit.count)")
                                    .font(.system(size: 150))
                                Text("Completed")
                            }
                        }
                        .foregroundColor(.white)
                    }
                    .padding()
                    
                    Spacer()
                    Spacer()
                    
                    Button {
                        completionCount()
                    } label: {
                        Text("Complete")
                            .frame(maxWidth: 250, maxHeight: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                    }
                }
            }
            .navigationTitle("Activity")
        }
    }
}

struct HabitView_Previews: PreviewProvider {

    static var previews: some View {
        HabitView(habit: HabitItem(name: "Name Here", description: "Something about it"), habits: Habits())
    }
}
