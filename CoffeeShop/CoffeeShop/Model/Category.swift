//
//  Category.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import Foundation

struct Category: Decodable {
    var name: String
    var products: [Product] = []
}
