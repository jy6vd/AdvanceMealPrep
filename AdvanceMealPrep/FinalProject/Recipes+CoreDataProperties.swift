//
//  Recipes+CoreDataProperties.swift
//  FinalProject
//
//  Created by Jonathan Yee on 5/2/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//

import UIKit
import CoreData


class Recipes: NSManagedObject{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipes> {
        return NSFetchRequest<Recipes>(entityName: "Recipes")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var meal: String?
    @NSManaged public var name: String?
    @NSManaged public var serving: String?
    @NSManaged public var direction: String?
    @NSManaged public var picture: String?
    @NSManaged public var rawIngredients: NSOrderedSet?
    @NSManaged public var savedDate: String?
    
    var ingredients: [Ingredients]?{
        return self.rawIngredients?.array as? [Ingredients]
    }
    
    convenience init?(name: String?,descriptions: String?, meal: String?, serving: String?, direction: String?, picture: String?, savedDate: String?){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else{
                return nil
        }
        self.init(entity: Recipes.entity(), insertInto: context)
        self.descriptions = descriptions
        self.meal = meal
        self.serving = serving
        self.direction = direction
        self.name = name
        self.picture = picture
        self.savedDate = savedDate
}
    

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
