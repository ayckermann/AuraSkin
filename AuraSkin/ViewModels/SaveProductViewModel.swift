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
        productEntity.expiredDate = product.expiredDate
        productEntity.currentlyUsed = product.currentlyUsed
        productEntity.ingredients = product.ingredients
//        productEntity.image = product.image // binary
        
//        let imageName = UUID().uuidString // Buat nama unik untuk gambar
//        LocalFileManager.instance.saveImage(image: product.image!, imageName: imageName, folderName: "ProductImages")
//        productEntity.imageName = imageName // Simpan nama gambar ke Core Data
        
        if let image = product.image {
            let imageName = UUID().uuidString // Buat nama unik untuk gambar
            LocalFileManager.instance.saveImage(image: image, imageName: imageName, folderName: "ProductImages")
            productEntity.imageName = imageName // Simpan nama gambar ke Core Data
        }

        
        do {
            try context.save()
            print("Product saved successfully!")
            print(productEntity)
        } catch {
            print("Whoops \(error.localizedDescription)")
        }
    }

    func getProductImage(imageName: String) -> UIImage? {
        return LocalFileManager.instance.getImage(imageName: imageName, folderName: "ProductImages")
    }
    
    func deleteProductImage(imageName: String) {
        LocalFileManager.instance.deleteImage(imageName: imageName, folderName: "ProductImages")
    }
    
}

