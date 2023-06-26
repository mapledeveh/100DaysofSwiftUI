//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Alex Nguyen on 2023-06-26.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/alxvngn/100DaysSwiftUI/4259cd0c285a0eb413b84bf9684488ccda1b7045/CupcakeCorner/cupcakes%403x.png"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "CAD"))")
                    .font(.title)
                
                Button("Place Order", action: { })
                    .buttonStyle(.borderedProminent)
            }
        }
        .navigationBarTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
