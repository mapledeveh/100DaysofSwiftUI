//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Alex Nguyen on 2023-06-15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var checkout = Checkout()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $checkout.order.type) {
                        ForEach(Items.types.indices) {
                            Text(Items.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(checkout.order.quantity)", value: $checkout.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $checkout.order.specialRequestEnabled.animation())
                    
                    if checkout.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $checkout.order.extraFrosting)
                        Toggle("Add extra sprkinkles", isOn: $checkout.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(checkout: checkout)
                    } label: {
                        Text("Deliver details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
