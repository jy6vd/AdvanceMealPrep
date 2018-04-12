//
//  RecipeViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/10/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

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
    
    let searchBar = UISearchController(searchResultsController: nil)
    var filterRecipe = [Recipe]()
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        searchBar.searchResultsUpdater = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = "Search Recipe"
        navigationItem.searchController = searchBar
        definesPresentationContext = true
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
        if isSearchBarFiltering() {
            return 1
        }
        return 1
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe: Recipe
        
        if isSearchBarFiltering() {
            recipe = filterRecipe[indexPath.row]
        } else {
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
    func searchBarIsEmpty() -> Bool{
        return searchBar.searchBar.text?.isEmpty ?? true
    }
    func filterSearchBarText(_ searchText: String, scope: String = "All"){
        filterRecipe = allRecipes.filter({( recipes : Recipe) -> Bool in
            return recipes.title.lowercased().contains(searchText.lowercased())
        })
        recipeTableView.reloadData()

    }
    func isSearchBarFiltering() -> Bool {
        return searchBar.isActive && !searchBarIsEmpty()
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
extension RecipeViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchBarText(searchController.searchBar.text!)
    }
}
