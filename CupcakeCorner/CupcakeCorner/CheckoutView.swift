//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Alex Nguyen on 2023-06-26.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var checkout = Checkout()
    @State private var showingConfirmation = false
    @State private var showingError = false
    @State private var confirmationMessage = ""
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/alxvngn/100DaysSwiftUI/4259cd0c285a0eb413b84bf9684488ccda1b7045/CupcakeCorner/cupcakes%403x.png"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .accessibilityHidden(true)
                } placeholder: {
                    ProgressView()
                        .accessibilityHidden(true)
                }
                .frame(height: 233)
                
                Text("Your total is \(checkout.order.cost, format: .currency(code: "CAD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                    .buttonStyle(.borderedProminent)
            }
        }
        .navigationBarTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert(showingError ? "Checkout Error" : "Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(checkout.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Items.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Items.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed.")
            confirmationMessage = "An unexpected error has occured."
            showingConfirmation = true
            showingError = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(checkout: Checkout())
    }
}
