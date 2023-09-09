//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Alex Nguyen on 2023-09-09.
//

import SwiftUI

extension VerticalAlignment {
//    struct MidAccountAndName: AlignmentID {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@mapledeveh")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("alex-nguyen")
                    .resizable()
                    .frame(width: 64, height: 64)
//                Text("Full name:")
//                Text("Full name:")
//                Text("Full name:")
//                Text("Full name:")
//                Text("Full name:")
            }
            
            VStack {
//                Text("Full name:")
//                Text("Full name:")
//                Text("Full name:")
//                Text("Full name:")
                Text("ALEX NGUYEN")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
