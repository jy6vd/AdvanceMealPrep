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
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case servingSize = "servingSize"
        case ingredients = "ingredients"
        case picture = "imageURL"
    }
    init(recipe: Recipe?, title: String, description: String, picture: String, servingSize: Int, ingredients: [Ingredient]) {
        self.title = title
        self.description = description
        self.servingSize = servingSize
        self.picture = picture
        self.ingredients = ingredients
        
    }
}
