//
//  ContentView.swift
//  BucketList
//
//  Created by Alex Nguyen on 2023-07-16.
//

import SwiftUI

enum LoadingState: CaseIterable {
    case loading, success, failed
    
    var name: String {
        switch self {
        case .loading:
            return "Loading"
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
}

struct LoadingView: View {
    var body: some View {
        Text("Loading View")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success View")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed View")
    }
}

struct ContentView: View {
    @State private var loadingState = LoadingState.loading
        
    var body: some View {
        VStack {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
            
            HStack {
                Button("Loading") {
                    loadingState = .loading
                }
                Button("Success") {
                    loadingState = .success
                }
                Button("Failed") {
                    loadingState = .failed
                }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
