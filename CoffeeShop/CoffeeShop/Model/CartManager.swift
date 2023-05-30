//
//  CartManager.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import Foundation

class CartManager: ObservableObject {
    @Published var products: [(Product, Int)] = []
}
