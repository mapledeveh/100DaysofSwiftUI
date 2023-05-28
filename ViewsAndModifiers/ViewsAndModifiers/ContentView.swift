//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alex Nguyen on 2023-05-04.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let cols: Int
//    let content: (Int, Int) -> Content
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<cols, id: \.self) { col in
                        content(row, col)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        GridStack(rows: 4, cols: 4) { row, col in
//            HStack {
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R\(row) C\(col)")
//            }
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
