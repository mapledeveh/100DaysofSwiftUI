//
//  ContentView.swift
//  Drawing
//
//  Created by Alex Nguyen on 2023-05-27.
//

import SwiftUI

struct Arrow: Shape {
    var tipSize: Double
    var shaftSize: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(tipSize, shaftSize)
        }
        
        set {
            tipSize = newValue.first
            shaftSize = newValue.second
        }
    }
            
    func path(in rect: CGRect) -> Path {
        let rightTipEnd = rect.maxX * tipSize
        let leftTipEnd = rect.maxX * (1 - tipSize)
        let rightShaftEnd = rect.maxX * shaftSize
        let leftShaftEnd = rect.maxX * (1 - shaftSize)
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rightTipEnd, y: rect.midY))
        path.addLine(to: CGPoint(x: rightShaftEnd, y: rect.midY))
        path.addLine(to: CGPoint(x: rightShaftEnd, y: rect.maxY))
        path.addLine(to: CGPoint(x: leftShaftEnd, y: rect.maxY))
        path.addLine(to: CGPoint(x: leftShaftEnd, y: rect.midY))
        path.addLine(to: CGPoint(x: leftTipEnd, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ContentView: View {
    @State private var tipSize = 0.75
    @State private var shaftSize = 0.65
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Arrow(tipSize: tipSize, shaftSize: shaftSize)
                    .frame(width: 300, height: 500)
                
                
                Spacer()
                
                HStack {
                    Button(tipSize == 0.75 ? "Blow me" : "Suck me") {
                        withAnimation {
                            if tipSize == 0.75 {
                                tipSize = 0.95
                                shaftSize = 0.80
                            } else {
                                tipSize = 0.75
                                shaftSize = 0.60
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                 
                    NavigationLink {
                        ColorCyclingRectangleView()
                    } label: {
                        Text("Rectangle")
                    }
                    .buttonStyle(.bordered)
                }
                
                /*
                 Text("Point Thicc")
                 Slider(value: $tipSize, in: 0.6...0.95)
                 .padding()
                 
                 Text("Shaft Thicc")
                 Slider(value: $shaftSize, in: 0.55...0.95)
                 .padding()
                 */
                Spacer()
            }
            .navigationTitle("Arrow")
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
