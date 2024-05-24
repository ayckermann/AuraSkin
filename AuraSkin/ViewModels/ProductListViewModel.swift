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
    @Published var selectedCategory: String = "Facial Wash"
    
    var starters: [String] {
            ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]
        }

    
    let dummyData = [
        Product(name: "Gaung",category: "Facial Wash", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Alif",category: "Toner", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Harby",category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 4", category: "Sunscreen", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Sample Product 5", category: "Moisturizer", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Sample Product 6", category: "Sunscreen", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Sample Product 7", category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 8", category: "Toner", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Gaung",category: "Facial Wash", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Alif",category: "Toner", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Harby",category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 4", category: "Sunscreen", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Sample Product 5", category: "Moisturizer", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Sample Product 6", category: "Sunscreen", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Sample Product 7", category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 8", category: "Toner", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Gaung",category: "Facial Wash", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Alif",category: "Toner", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Harby",category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 4", category: "Sunscreen", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Sample Product 5", category: "Moisturizer", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Sample Product 6", category: "Sunscreen", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Sample Product 7", category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 8", category: "Toner", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Gaung",category: "Facial Wash", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Alif",category: "Toner", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Harby",category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 4", category: "Sunscreen", description: "Description for sample product 4", imageUrl: "chetapil"),
        Product(name: "Sample Product 5", category: "Moisturizer", description: "Description for sample product 1", imageUrl: "unsplash_p3O5f4u95Lo"),
        Product(name: "Sample Product 6", category: "Sunscreen", description: "Description for sample product 2", imageUrl: "unsplash_ZIihTgf5uGg"),
        Product(name: "Sample Product 7", category: "Moisturizer", description: "Description for sample product 3", imageUrl: "avoskin"),
        Product(name: "Sample Product 8", category: "Toner", description: "Description for sample product 4", imageUrl: "chetapil")

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
    
    var filteredSegmentProducts: [Product] {
           products.filter { product in
               (selectedCategory.isEmpty || product.category == selectedCategory) &&
               (searchText.isEmpty || product.name.lowercased().contains(searchText.lowercased()))
           }
       }
}
