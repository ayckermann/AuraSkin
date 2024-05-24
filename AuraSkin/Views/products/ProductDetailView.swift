//
//  ProductDetailView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 24/05/24.
//

import SwiftUI

struct ProductDetailView: View {
    @State var isOn: Bool = true

    var body: some View {
        NavigationStack {
            VStack {
                SectionTextLeading("NAMA PRODUCT")
                    .foregroundStyle(.accent)
                    .padding(.bottom)

                HStack {
                    Text("Facial Wash") // category
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Expired 29-03-2024")
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
                .padding(.bottom)

                ToggleComponent(text: "Currently used", isOn: $isOn)

                AnalysisResultComponent(ingredients: ingredientsDummy)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button(action: edit) {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    Button(role: .destructive, action: delete) {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }

    private func edit() -> Void {}

    private func delete() -> Void {}
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductDetailView()
        }
    }
}

#Preview {
    ProductDetail_Previews.previews
}
