//
//  Ingredients+CoreDataClass.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Ingredients)
public class Ingredients: NSManagedObject {
    convenience init?(name: String, quantity: Double, unit: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Recipes.entity(), insertInto: context)
        self.name = name
        self.quantity = quantity
        self.units = unit
        
    }
    
}
