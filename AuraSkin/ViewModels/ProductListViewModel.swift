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
    @FetchRequest(
           entity: Product.entity(),
           sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
       ) var products: FetchedResults<Product>
}
