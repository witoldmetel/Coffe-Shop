//
//  MenuPage.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    @State var searchQuery: String = ""
    
    var body: some View {
        NavigationView
            {
                    List {
                        Image("Logo").listRowBackground(Color("Secondary"))
                        
                        ForEach(menuManager.menu) { category in
                            if category.filteredItems(text: searchQuery).count > 0 {
                                Text(category.name)
                                    .listRowBackground(Color("CardBackground"))
                                    .foregroundColor(Color("Secondary"))
                                    .bold()
                                    .padding()
                            }
                            ForEach(category.filteredItems(text: searchQuery)) { item in
                                ZStack {
                                    NavigationLink(destination: DetailsPage(product: item)) {
                                        EmptyView()
                                    }.opacity(0)
                                    ProductItem(product: item)
                                        .padding(.top)
                                        .padding(.leading)
                                        .padding(.bottom, 12)
                                }
                                
                            }
                        }
                    }.navigationTitle("Products").refreshable {
                        menuManager.refreshItemsFromNetwork()
                    }.searchable(text: $searchQuery)
            }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage().environmentObject(MenuManager())
    }
}
