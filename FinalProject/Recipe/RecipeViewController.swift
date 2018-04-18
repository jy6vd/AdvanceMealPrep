//
//  RecipeViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/10/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    struct Ingredient {
        var title: String
        var quantitiy: Double
        var units: String
    }
    
    struct Recipe {
        var title: String
        var description: String
        var caloriesLow: Int
        var caloriesHigh: Int
        var ingredients: [Ingredient]
        var servingSize: Int
        var picture: UIImage
    }
    
    var allRecipes: [Recipe] = []
    var userRecipes: [Recipe] = []
    
    func loadRecipes(){
        allRecipes.append(Recipe(title: "Donut", description: "Sweet dessert", caloriesLow: 29, caloriesHigh: 395,
            ingredients: ([Ingredient(title: "Wheat", quantitiy: 10, units: "oz")]),
            servingSize: 1, picture: UIImage(named: "donut")!))
        allRecipes.append(Recipe(title: "Peas", description: "Sweet dessert", caloriesLow: 29, caloriesHigh: 395,
            ingredients: ([Ingredient(title: "Wheat", quantitiy: 10, units: "oz")]),
            servingSize: 1, picture: UIImage(named: "donut")!))

    }
    
    func addRecipe(recipe: Recipe){
        userRecipes.append(recipe)
        
    }
    
    var filterRecipe = [Recipe]()
    var isSearchingRecipe = false
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        loadRecipes()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearchingRecipe){
            return filterRecipe.count
        }
        return allRecipes.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe: Recipe
        
        if(isSearchingRecipe){
            recipe = filterRecipe[indexPath.row]
        }
        else{
            recipe = allRecipes[indexPath.row]
        }
        
//        cell.foodTitle.text = "Donut"
//        cell.foodImage.image = UIImage(named: "donut")
//        cell.calories.text = "Calories: 29 - 395"
        cell.foodTitle.text = recipe.title
        cell.foodImage.image = recipe.picture
        cell.calories.text = "Calories: \(recipe.caloriesLow) - \(recipe.caloriesHigh)"
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearchingRecipe = false

            recipeTableView.reloadData()
            
        } else {
            
            isSearchingRecipe = true
            
            filterRecipe = allRecipes.filter{ $0.title.range(of: searchText, options: [.caseInsensitive]) != nil  }
            
            recipeTableView.reloadData()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
