//
//  Ingredients+CoreDataProperties.swift
//  FinalProject
//
//  Created by Jonathan Yee on 5/2/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//

import UIKit
import CoreData


class Ingredients: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredients> {
        return NSFetchRequest<Ingredients>(entityName: "Ingredients")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: String?
    @NSManaged public var units: String?
    @NSManaged public var recipe: Recipes?


    convenience init?(name: String, quantity: String, unit: String, recipe: Recipes){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Recipes.entity(), insertInto: context)
        self.name = name
        self.quantity = quantity
        self.units = unit
        self.recipe = recipe
    }
}
