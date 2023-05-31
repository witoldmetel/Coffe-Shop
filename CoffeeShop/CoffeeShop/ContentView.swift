//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Witold on 29/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        TabView {
            MenuPage().tabItem {
                Image(systemName: "cup.and.saucer")
                Text("Menu")
            }
            OffersPage().tabItem {
                Image(systemName: "tag")
                Text("Offers")
            }
            OrdersPage().tabItem {
                Image(systemName: "cart")
                Text("My Order")
            }.badge(cartManager.products.count)
            InfoPage().tabItem {
                Image(systemName: "info.circle")
                Text("Info")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CartManager())
    }
}

