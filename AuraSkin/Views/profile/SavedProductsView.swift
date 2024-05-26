//
//  SavedProductsView.swift
//  AuraSkin
//
//  Created by Risma Harby on 23/05/24.
//

import SwiftUI

struct SavedProductsView: View {
    @StateObject var viewModel = ProductListViewModel()
    @State private var category = ""
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "Facial Wash"
    
    let categories = ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]
    @FetchRequest(sortDescriptors: []) private var products: FetchedResults<Product>
    
    let colorHex = "#003C43"
    
    var body: some View {
        NavigationStack {
            HStack {
                SectionTextLeading("Current Use")
                    .foregroundColor(Color.auraSkinPrimaryColor)
            }.padding(.horizontal)
            Spacer()
            VStack {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible(), spacing: 1)]) {
                        ForEach(filteredProducts, id: \.self) { product in
                            ProductCardView(name: product.name ?? "no name", category: product.category ?? "", imageName: product.image ?? Data(), productId: product.id ?? UUID())
                                .listRowSeparator(.hidden, edges: .all)
                        }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .listStyle(.plain)
                .navigationTitle("Saved Products")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchText)
                .padding(.leading, -5)
                
                Spacer()
                Spacer()
                Spacer()
                
                SavedSegmentedControl(selection: $selectedCategory, categories: categories)
                    .padding(.horizontal, 9)
                    .frame(height: 30)

                // below is for after segment
                List {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 30),
                        GridItem(.flexible(), spacing: 30),
                        GridItem(.flexible())
                    ]) {
                        ForEach(filteredSegmentProducts, id: \.self) { product in
                            ProductCardMiniView(name: product.name ?? "no name", imageName: product.image ?? Data())
                                .listRowSeparator(.hidden, edges: .all)
                        }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                }
                .listStyle(.plain)
                .navigationTitle("Saved Products")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $selectedCategory)
            }
        }
    }
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products.map { $0 }
        } else {
            return products.filter { product in
                (product.name?.lowercased().contains(searchText.lowercased()) ?? false) ||
                (product.category?.lowercased().contains(searchText.lowercased()) ?? false)
            }
        }
    }
    var filteredSegmentProducts: [Product] {
        return products.filter { product in
            (product.category == selectedCategory) &&
            (searchText.isEmpty || (product.name?.lowercased().contains(searchText.lowercased()) ?? false))
        }
    }
}

#Preview {
    SavedProductsView()
    
}
