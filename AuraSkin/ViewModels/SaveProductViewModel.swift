//
//  SavedProductViewModel.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 23/05/24.
//

import Foundation
import CoreData
import SwiftUI

class SaveProductViewModel {
    
    func saveProduct(context: NSManagedObjectContext, product: ProductModel) {
        let productEntity = Product(context: context)
        productEntity.id = product.id
        productEntity.name = product.name
        productEntity.expired = product.expiredDate
        productEntity.currentlyUsed = product.currentlyUsed
        productEntity.ingredients = product.ingredients
        productEntity.image = product.image
        
        do {
            try context.save()
            print("Product saved successfully!")
            print(productEntity)
        } catch {
            print("Whoops \(error.localizedDescription)")
        }
    }
}



//import Foundation
//import CoreData
//import SwiftUI
//
//class SaveProductViewModel {
//    
//    func saveProduct(context: NSManagedObjectContext, name: String, ingredients: String, category: String, currentlyUsed: Bool, expiredDate: Date, image: UIImage){
//        let product = Product(context: context)
//        product.id = UUID()
//        product.name = name
//        product.expired = expiredDate
//        product.currentlyUsed = currentlyUsed
//        product.ingredients = ingredients
//        product.image = image.pngData()
//        
//        do {
//            try context.save()
//            print("Product saved successfully!")
//            print(product)
//        } catch {
//            print("Whoops \(error.localizedDescription)")
//        }
//    }
//}
