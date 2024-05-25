//
//  ProductModel.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 23/05/24.
//

import Foundation

struct ProductModel {
    var id: UUID
    var name: String
    var ingredients: String
    var category: String
    var currentlyUsed: Bool
    var expiredDate: Date
    var image: Data?

    init(id: UUID = UUID(), name: String, ingredients: String, category: String, currentlyUsed: Bool, expiredDate: Date, image: Data? = nil) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.category = category
        self.currentlyUsed = currentlyUsed
        self.expiredDate = expiredDate
        self.image = image
    }
}


