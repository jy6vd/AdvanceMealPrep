//
//  ViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 3/13/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    struct Ingredient {
        var title: String
        var quantitiy: Double
        var units: String
    }
    
    struct Recipe {
        var title: String
        var description: String
        var ingredients: [Ingredient]
        var servingSize: Int
        var picture: UIImage
    }
    
    var userRecipes: [Recipe] = []
    
    func loadRecipes(){}
    
    func addRecipe(recipe: Recipe){
        userRecipes.append(recipe)

}

}
