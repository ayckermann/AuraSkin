//
//  TestingProductDetailView.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 26/05/24.
//

import SwiftUI
import CoreData

struct TestingProductDetailView: View {
    
    @State var product: Product
    @State var context: NSManagedObjectContext
    @State private var isPresentedEdit: Bool = false
    
    @Environment(\.dismiss) var dismiss

    
    var defaultImageData: Data = UIImage(resource: .productImageDefault).pngData()!
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Image(uiImage: UIImage(data: product.image ?? defaultImageData)!)
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
        }
        .toolbar {
            Button(action: {
                isPresentedEdit = true
            }, label: {
                Image(systemName: "square.and.pencil")
            })
            Button(action: {
                context.delete(product)
                do {
                    try context.save()
                    print("Product delete successfully!")
                    print(product)
                    self.dismiss()
                } catch {
                    print("Whoops \(error.localizedDescription)")
                }
            }, label: {
                Image(systemName: "trash")
            })
        }
        .sheet(isPresented: $isPresentedEdit) {
            EditProductView(context: $context, product: $product, isPresentedEdit: $isPresentedEdit)
        }
    
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    

}

//#Preview {
//    TestingProductDetailView(product: <#Product#>)
//}

//    func getProduct(with id: UUID?) -> Product?{
//        guard let id = id else {return nil}
//
//        let request = Product.fetchRequest() as NSFetchRequest<Product>
//
//        request.predicate = NSPredicate(format: "%K == %@", "id", id as CVarArg)
//        guard let products = try? context.fetch(request) else {return nil}
//
//        return products.first
//
//    }

//    init(id: UUID ,context: NSManagedObjectContext){
//        self.id = id
//        self.context = context
//        self.product = getProduct(with: id)!
//    }
