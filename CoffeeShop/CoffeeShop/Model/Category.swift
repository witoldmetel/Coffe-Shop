//
//  Category.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import Foundation

struct Category: Decodable, Identifiable {
    var id: String {
        return self.name
    }
    var name: String
    var products: [Product] = []
    
    func filteredItems(text: String) -> [Product] {
            if text.count > 0 {
                return products.filter({ item in
                    item.name.contains(text)
                })
            } else {
                return products
            }
        }
}
