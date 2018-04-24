//
//  recipe.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/23/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import Foundation
struct Recipe: Codable{
    var title: String
    var description: String
    var ingredients: [Ingredient]
    var servingSize: Int
    var picture: String
}
