//
//  ProductListViewModel.swift
//  AuraSkin
//
//  Created by Risma Harby on 23/05/24.
//

import Foundation
import CoreData
import SwiftUI

class ProductListViewModel: ObservableObject {
    @Published var searchText: String       = ""
    @Published var selectedCategory: String = "Facial Wash"
    @Published var products: [ProductModel]      = []
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: []
    ) private var fetchedProducts: FetchedResults<Product>
    
    
    var starters: [String] {
        ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]
    }
    
    init() {
        //        self.context = context
        products = fetchedProducts.map { product in
            ProductModel(
                name: product.name ?? "Unknown",
                ingredients: product.ingredients ?? "",
                category: product.category ?? "Unknown",
                currentlyUsed: product.currentlyUsed,
                expiredDate: product.expiredDate ?? Date(),
                image: product.image ?? Data()
            )
        }
    }
    
    private func loadProducts() {
        products = fetchedProducts.map { product in
            ProductModel(
                name: product.name ?? "Unknown",
                ingredients: product.ingredients ?? "",
                category: product.category ?? "Unknown",
                currentlyUsed: product.currentlyUsed,
                expiredDate: product.expiredDate ?? Date(),
                image: product.image ?? Data()
            )
        }
    }
    
    var filteredProducts: [ProductModel] {
        print (products )
        guard !searchText.isEmpty else { return products }
        return products.filter { product in
            return (product.name.lowercased().contains(searchText.lowercased()))
        }
    }
    
    
    
    var filteredSegmentProducts: [ProductModel] {
        products.filter { product in
            (selectedCategory.isEmpty || product.category == selectedCategory) &&
            (searchText.isEmpty || ((product.name.lowercased().contains(searchText.lowercased()))))
        }
    }
}
