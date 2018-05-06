//
//  ingredients.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/23/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import Foundation

struct Ingredient: Codable {
    var title: String
    var quantity: String
    var units: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case quantity = "quantity"
        case units = "units"
    }
//    init(ingredient: Ingredient?, title: String, quantity: Double, units: String) {
//        self.title = title
//        self.quantity = quantity
//        self.units = units
//    }
}
    
