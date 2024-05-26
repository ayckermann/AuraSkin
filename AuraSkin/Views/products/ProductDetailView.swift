//
//  ProductDetailView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 24/05/24.
//

import SwiftUI
import CoreData

struct ProductDetailView: View {
    @State var isOn: Bool = true
//    var product: Product
    
    @State var product: Product
    @State var context: NSManagedObjectContext
    @Environment(\.dismiss) var dismiss
    @State var isPresentedEdit = false

    
//    init(product: Product) {
//        self.product = product
//    }

    var body: some View {
        NavigationStack {
            VStack {
                SectionTextLeading(product.name ?? "No Name")
                    .foregroundStyle(.accent)
                    .padding(.bottom)

                HStack {
                    Text(product.category ?? "No Category") // category
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)

//                    Text("\(String(describing: product.expiredDate))")
                    Text(getDate(from: product.expiredDate ?? Date()))
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
                .padding(.bottom)

                ToggleComponent(text: "Currently used", isOn: $isOn)

                AnalysisResultComponent(ingredients: product.ingredients ?? "No Ingredients")

                Spacer()
            }
            .padding([.horizontal, .top], 15)
        }
        .onAppear() {
            isOn = product.currentlyUsed
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button(action: {
                        isPresentedEdit = true
                    }) {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    Button(role: .destructive, action: {
                        context.delete(product)
                        do {
                            try context.save()
                            print("Product delete successfully!")
                            print(product)
                            self.dismiss()
                        } catch {
                            print("Whoops \(error.localizedDescription)")
                        }
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .sheet(isPresented: $isPresentedEdit) {
            EditProductView(context: $context, product: $product, isPresentedEdit: $isPresentedEdit)
        }
    }

    
    func getDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        return dateFormatter.string(from: date)
    }
    
    private func edit() -> Void {}

    private func delete() -> Void {
//        context.delete(product)
//        do {
//            try context.save()
//            print("Product delete successfully!")
//            print(product)
//            self.dismiss()
//        } catch {
//            print("Whoops \(error.localizedDescription)")
//        }
    }
}

//struct ProductDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            ProductDetailView()
//        }
//    }
//}

//#Preview {
//    ProductDetail_Previews.previews
//}
