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
    var starters = ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]
    
    var body: some View {
        
        NavigationStack {
            HStack {
                SectionTextLeading("Current Use")
                    .foregroundColor(Color.auraSkinPrimaryColor)
            }.padding(.horizontal)
            VStack {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible(), spacing: 1)]) {
                        ForEach(viewModel.filteredProducts) { product in
                            ProductCardView(name: product.name, category: "Face Wash", imageName: product.imageUrl)
                                .listRowSeparator(.hidden, edges: .all)
                        }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                }
                .frame(maxWidth: .infinity)
                .listStyle(.plain)
                .navigationTitle("Saved Products")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText)
                
                Spacer()
                Spacer()
                Spacer()
                
                Picker("Choose your starter",
                       selection: $category) {
                    ForEach(starters, id: \.self) {
                        Text($0)
                    }
                }
                       .frame(height: 40)
                       .cornerRadius(14)
                       .pickerStyle(.segmented)
                       .padding(.horizontal)
                
                // below is for after segment
                List {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 30), GridItem(.flexible())]) {
                        ForEach(viewModel.filteredProducts) { product in
                            ProductCardView(name: product.name, category: "Face Wash", imageName: product.imageUrl)
                                .listRowSeparator(.hidden, edges: .all)
                        }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                    
                }
                .listStyle(.plain)
                .navigationTitle("Saved Products")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText)
            }
        }
    }
}

#Preview {
    SavedProductsView()
}
