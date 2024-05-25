//
//  ProductDummy.swift
//  AuraSkin
//
//  Created by Risma Harby on 24/05/24.
//

import Foundation

struct ProductDummy: Identifiable {
    let id: UUID
    let name: String
    let category: String
    let description: String
    let imageUrl: String

    init(id: UUID = UUID(), name: String, category: String, description: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.category = category
        self.description = description
        self.imageUrl = imageUrl
    }
}
