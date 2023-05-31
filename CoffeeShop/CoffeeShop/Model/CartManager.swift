//
//  CartManager.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import Foundation

class CartManager: ObservableObject {
    @Published var products: [(Product, Int)] = []
    @Published var totalOrders: Int = 0
    
    func add(product: Product, quantity: Int) {
        self.totalOrders += quantity
        
        if let existingIndex = products.firstIndex(where: {$0.0.id == product.id}) {
            // Item already exists, add it as a new item
            let existingItem = products[existingIndex]
            let mergedQuantity = existingItem.1 + quantity
            
            products[existingIndex] = (existingItem.0, mergedQuantity)
        } else {
            // Item does not exist, add it as a new item
            products.append((product, quantity))
        }
    }
    
    func remove(product: Product) {
        self.products.removeAll { itemInCart in
            if itemInCart.0.id == product.id {
                self.totalOrders = self.totalOrders - itemInCart.1
            }
            
            return itemInCart.0.id == product.id
        }
    }
    
    func clear() {
           products.removeAll()
       }
       
    func total() -> Double {
           var total = 0.0
        
           for item in products {
               total += item.0.price * Double(item.1)
           }
        
           return total
       }
}
