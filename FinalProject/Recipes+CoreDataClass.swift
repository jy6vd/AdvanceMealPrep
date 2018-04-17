//
//  Recipes+CoreDataClass.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Recipes)
public class Recipes: NSManagedObject {
    var ingredients: [Ingredients]?{
        return self.rawIngredients?.array as? [Ingredients]
    }
    convenience init?(name: String?, descriptions: String?, serving: Double, calorieHi: Double, calorieLow: Double,meal: String?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Recipes.entity(), insertInto: context)
        self.name = name
        self.descriptions = descriptions
        self.serving = serving
        self.caloriesHi = calorieHi
        self.caloriesLow = calorieLow
        self.meal = meal
    }
}
