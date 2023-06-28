//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Alex Nguyen on 2023-06-26.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var checkout: Checkout
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $checkout.order.name)
                TextField("Address", text: $checkout.order.streetAddress)
                TextField("City", text: $checkout.order.city)
                TextField("Postal Code", text: $checkout.order.postalCode)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(checkout: checkout)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(checkout.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(checkout: Checkout())
        }
    }
}
