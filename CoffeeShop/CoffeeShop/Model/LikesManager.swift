//
//  LikesManager.swift
//  CoffeeShop
//
//  Created by Witold on 31/05/2023.
//

import Foundation

class LikesManager: ObservableObject {
    @Published var likes: [Int] = []
    
    static let key = "likes"
    
    init() {
        likes = UserDefaults.standard.array(forKey: LikesManager.key) as? [Int] ?? []
    }
    
    func isLiked(id: Int) -> Bool {
        return likes.contains(id)
    }
    
    func toggle(_ id: Int) {
        if isLiked(id: id) {
            likes.removeAll { $0 == id }
        } else {
            likes.append(id)
        }
        
        UserDefaults.standard.set(likes, forKey: LikesManager.key)
    }
}
