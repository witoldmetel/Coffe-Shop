//
//  CoffeeShopApp.swift
//  CoffeeShop
//
//  Created by Witold on 29/05/2023.
//

import SwiftUI

@main
struct CoffeeShopApp: App {
    var menuManager = MenuManager()
    var cartManager = CartManager()
    var likesManager = LikesManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(cartManager)
                .environmentObject(likesManager)
        }
    }
}
