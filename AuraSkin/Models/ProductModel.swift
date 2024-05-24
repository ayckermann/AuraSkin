//
//  ProductModel.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 23/05/24.
//

import Foundation
import SwiftUI

struct ProductModel {
    var id: UUID
    var name: String
    var ingredients: String
    var category: String
    var currentlyUsed: Bool
    var expiredDate: Date
//    var image: Data?
    var imageName: String?
    var image: UIImage?

//    init(id: UUID = UUID(), name: String, ingredients: String, category: String, currentlyUsed: Bool, expiredDate: Date, image: Data? = nil) { // binary
    init(id: UUID = UUID(), name: String, ingredients: String, category: String, currentlyUsed: Bool, expiredDate: Date, imageName: String, image: UIImage) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.category = category
        self.currentlyUsed = currentlyUsed
        self.expiredDate = expiredDate
//        self.image = image // binary
        self.imageName = imageName
        self.image = image
    }
}


