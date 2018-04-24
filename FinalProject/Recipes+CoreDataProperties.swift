//
//  Recipes+CoreDataProperties.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//

import Foundation
import CoreData


extension Recipes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipes> {
        return NSFetchRequest<Recipes>(entityName: "Recipes")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var name: String?
    @NSManaged public var serving: Double
    @NSManaged public var rawIngredients: NSOrderedSet?

}

// MARK: Generated accessors for rawIngredients
extension Recipes {

    @objc(insertObject:inRawIngredientsAtIndex:)
    @NSManaged public func insertIntoRawIngredients(_ value: Ingredients, at idx: Int)

    @objc(removeObjectFromRawIngredientsAtIndex:)
    @NSManaged public func removeFromRawIngredients(at idx: Int)

    @objc(insertRawIngredients:atIndexes:)
    @NSManaged public func insertIntoRawIngredients(_ values: [Ingredients], at indexes: NSIndexSet)

    @objc(removeRawIngredientsAtIndexes:)
    @NSManaged public func removeFromRawIngredients(at indexes: NSIndexSet)

    @objc(replaceObjectInRawIngredientsAtIndex:withObject:)
    @NSManaged public func replaceRawIngredients(at idx: Int, with value: Ingredients)

    @objc(replaceRawIngredientsAtIndexes:withRawIngredients:)
    @NSManaged public func replaceRawIngredients(at indexes: NSIndexSet, with values: [Ingredients])

    @objc(addRawIngredientsObject:)
    @NSManaged public func addToRawIngredients(_ value: Ingredients)

    @objc(removeRawIngredientsObject:)
    @NSManaged public func removeFromRawIngredients(_ value: Ingredients)

    @objc(addRawIngredients:)
    @NSManaged public func addToRawIngredients(_ values: NSOrderedSet)

    @objc(removeRawIngredients:)
    @NSManaged public func removeFromRawIngredients(_ values: NSOrderedSet)

}
