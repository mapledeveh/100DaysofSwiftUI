//
//  ColorCyclingRectangleView.swift
//  Drawing
//
//  Created by Alex Nguyen on 2023-05-31.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingRectangleView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
                .padding()
        }
        .preferredColorScheme(.dark)
    }
}

struct ColorCyclingRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectangleView()
    }
}
