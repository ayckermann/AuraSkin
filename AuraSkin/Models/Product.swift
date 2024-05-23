//
//  Product.swift
//  AuraSkin
//
//  Created by Risma Harby on 23/05/24.
//

import Foundation

struct Product: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let imageUrl: String

    init(id: UUID = UUID(), name: String, description: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
    }
}
