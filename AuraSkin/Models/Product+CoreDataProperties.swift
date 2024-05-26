//
//  Product+CoreDataProperties.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 26/05/24.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var category: String?
    @NSManaged public var currentlyUsed: Bool
    @NSManaged public var expiredDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var ingredients: String?
    @NSManaged public var name: String?
    

}

extension Product : Identifiable {

}
