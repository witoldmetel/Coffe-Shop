//
//  MenuPage.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        NavigationView
            {
                    List {
                        Image("Logo").listRowBackground(Color("Secondary"))
                        
                        ForEach(menuManager.menu) { category in
                            Text(category.name).foregroundColor(Color("Secondary")).bold()
                            
                            ForEach(category.products) { product in
                                NavigationLink(destination: DetailsPage(product: product)) {
                                        ProductItem(product: product)
                                    }.listRowSeparator(.hidden)
                            }
                        }.listRowBackground(Color("CardBackground"))
                    }.navigationTitle("Products").refreshable {
                        menuManager.refreshItemsFromNetwork()
                    }
            }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage().environmentObject(MenuManager())
    }
}
