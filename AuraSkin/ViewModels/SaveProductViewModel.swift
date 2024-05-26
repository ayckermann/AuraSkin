//
//  SavedProductViewModel.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 23/05/24.
//

import Foundation
import CoreData
import SwiftUI

extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else { return nil }
        self = .init(uiImage: image)
    }
}

class SaveProductViewModel {
    
    func saveProduct(context: NSManagedObjectContext, product: ProductModel) {
        let productEntity = Product(context: context)
        productEntity.id = product.id
        productEntity.name = product.name
        productEntity.category = product.category
        productEntity.expiredDate = product.expiredDate
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

