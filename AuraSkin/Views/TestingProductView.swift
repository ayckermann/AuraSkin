//
//  TestingProductView.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 25/05/24.
//

import SwiftUI

struct TestingProductView: View {
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var products: FetchedResults<Product>
    
    private var saveProductViewModel = SaveProductViewModel()
    
    private var defaultImageData: Data = UIImage(resource: .productImageDefault).pngData()!
    
//    var defaultImage: UIImage?
//    var defaultImageData: Data?
//    
//    init() {
//        self.defaultImage = UIImage(named: "productImageDefault")
//        self.defaultImageData = self.defaultImage?.pngData()
//    }


    var body: some View {
        NavigationStack {
            List {
                ForEach(products, id: \.self) { product in
                    NavigationLink(destination: TestingProductDetailView(product: product, context: viewContext)) {
//                    NavigationLink(destination: TestingProductDetailView(product: product) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Image(uiImage: UIImage(data: (product.image ?? defaultImageData)!)!)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text(product.name ?? "")
                                    .font(.title3)
                                Text(formatDate(product.expiredDate ?? Date()))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(product.category ?? "nil")
                            }
                            Spacer()
                        }
                    }
                }
                .onDelete(perform: delete)
            }
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
//                saveProductViewModel.deleteProductImage(imageName: product.imageName!)
                try viewContext.save()
                print("perform delete")
            } catch {
                // handle the Core Data error
            }
        }
    }
    
    
}

#Preview {
    TestingProductView()
}


