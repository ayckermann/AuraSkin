//
//  TestingReadProductView.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 24/05/24.
//

import SwiftUI

struct TestingReadProductView: View {
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var products: FetchedResults<Product>
    
    private var saveProductViewModel = SaveProductViewModel()

    var body: some View {
        List {
            ForEach(products, id: \.self) { product in
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Image(uiImage: saveProductViewModel.getProductImage(imageName: product.imageName!) ?? UIImage(resource: .productImageDefault))
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(product.name ?? "")
                            .font(.title3)
                        Text(formatDate(product.expiredDate ?? Date()))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(product.ingredients ?? "nil")
                        Text(product.category ?? "nil")
                    }
                    Spacer()
                }
            }
            .onDelete(perform: delete)
        }
        
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let product = products[index]
            // MARK: Core Data Operations
            self.viewContext.delete(product)

            do {
                saveProductViewModel.deleteProductImage(imageName: product.imageName!)
                try viewContext.save()
                print("perform delete")
            } catch {
                // handle the Core Data error
            }
        }
    }
    
    
}

#Preview {
    TestingReadProductView()
}
