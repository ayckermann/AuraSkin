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
    
    let colorHex = "#003C43"
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.auraSkinPrimaryColor)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
    }
    
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
                        ForEach(viewModel.filteredProducts) { product in
                            ProductCardView(name: product.name, category: product.category, imageName: product.imageUrl)
                                .listRowSeparator(.hidden, edges: .all)
                        }
                    }
                    .listRowSeparator(.hidden, edges: .all)
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .listStyle(.plain)
                .navigationTitle("Saved Products")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText)
                .padding(.leading, -5)
                
                Spacer()
                Spacer()
                Spacer()
                
                
                Picker("Choose your starter", selection: $viewModel.selectedCategory) {
                    ForEach(productCategory, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.leading, 9)
                .padding(.trailing, 9)
                .frame(height: 30)
                
                // below is for after segment
                List {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 30),
                        GridItem(.flexible(), spacing: 30),
                        GridItem(.flexible())
                    ]) {
                        ForEach(viewModel.filteredSegmentProducts) { product in
                            ProductCardMiniView(name: product.name, imageName: product.imageUrl)
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
