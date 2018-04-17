//
//  Ingredients+CoreDataProperties.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//

import Foundation
import CoreData


extension Ingredients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredients> {
        return NSFetchRequest<Ingredients>(entityName: "Ingredients")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Double
    @NSManaged public var units: String?
    @NSManaged public var recipe: NSSet?

}

// MARK: Generated accessors for recipe
extension Ingredients {

    @objc(addRecipeObject:)
    @NSManaged public func addToRecipe(_ value: Recipes)

    @objc(removeRecipeObject:)
    @NSManaged public func removeFromRecipe(_ value: Recipes)

    @objc(addRecipe:)
    @NSManaged public func addToRecipe(_ values: NSSet)

    @objc(removeRecipe:)
    @NSManaged public func removeFromRecipe(_ values: NSSet)

}
