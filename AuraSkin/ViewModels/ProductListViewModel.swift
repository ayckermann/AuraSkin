//
//  ProductListViewModel.swift
//  AuraSkin
//
//  Created by Risma Harby on 23/05/24.
//

import Foundation
class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var searchText: String = ""
    
    let dummyData = [
        Product(name: "Gaung", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Alif", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Harby", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 4", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Sample Product 5", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Sample Product 6", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Sample Product 7", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 8", description: "Description for sample product 4", imageUrl: "chetapil")

    ]
    
    init() {
        products = dummyData
    }
    
    var filteredProducts: [Product] {
        guard !searchText.isEmpty else { return products }
        return products.filter { product in
            product.name.lowercased().contains(searchText.lowercased())
        }
    }
}
