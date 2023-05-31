//
//  DetailsPage.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import SwiftUI

struct DetailsPage: View {
    // It's good practice to keep @State as private
    @State private var quantity = 1
    
    var product: Product
    
    var body: some View {
            ScrollView {
                AsyncImage(url: product.imageURL)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                    .padding(.top, 32)
                Text(product.name)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(24)
                HStack {
                    Text("$ \(product.price, specifier: "%.2f") ea")
                    Stepper(value: $quantity, in: 1...10) { }
                }
                    .frame(maxWidth: .infinity)
                    .padding(30)
                                
                Text("Subtotal $\(Double(quantity) * product.price, specifier: "%.2f")")
                    .bold()
                    .padding(12)
                
                Button("Add \(quantity) to Cart") {
                    //TODO
                }
                    .padding()
                    .frame(width: 250.0)
                    .background(Color("Alternative2"))
                    .foregroundColor(Color.black)
                    .cornerRadius(25)

            }
       
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(product: Product(id: 1, name: "Coffee", price: 2.21))
    }
}
