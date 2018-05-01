//
//  RecipeViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/10/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    let allRecipes: [mealType] = Response<mealType>.retrieve(fromResource: "mealJSON")
    
    var filterRecipe: [mealType] = []
    
//    let viewRecipeViewController = AddRecipeViewController()
    
    var isSearchingRecipe = false
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allRecipes.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return allRecipes[section].mealType
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearchingRecipe){
            return filterRecipe.count
        }
        //return regions[section].companies.count
        return allRecipes[section].recipes.count
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 160
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        
        if(isSearchingRecipe){
            cell.foodTitle.text = filterRecipe[indexPath.section].recipes[indexPath.row].title
            cell.foodDescription.text = filterRecipe[indexPath.section].recipes[indexPath.row].description
            if let url = NSURL(string: filterRecipe[indexPath.section].recipes[indexPath.row].picture){
                if let data = NSData(contentsOf: url as URL){
                    cell.foodImage.image = UIImage(data: data as Data)
                }
            }
        }
        else{
            cell.foodTitle.text = allRecipes[indexPath.section].recipes[indexPath.row].title
            cell.foodDescription.text = allRecipes[indexPath.section].recipes[indexPath.row].description
            if let url = NSURL(string: allRecipes[indexPath.section].recipes[indexPath.row].picture){
                if let data = NSData(contentsOf: url as URL){
                    cell.foodImage.image = UIImage(data: data as Data)
                }
            }
        }
    
        return cell
    }
    
    //needs to be fixed
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearchingRecipe = false

            recipeTableView.reloadData()
            
        } else {
            
            isSearchingRecipe = true
            var filteredRecipes: [Recipe] = []
           // filterRecipe = allRecipes.filter{ $0.title.range == searchText/*(of: searchText, options: [.caseInsensitive]) != nil */ }
            for recipe in allRecipes {
                filteredRecipes.append(contentsOf: recipe.recipes.filter{ $0.title == searchText })
            }
            filterRecipe[0].recipes = filteredRecipes
            recipeTableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewRecipeSegue"{
            let indexPath = self.recipeTableView.indexPathForSelectedRow!
            let secondViewController = segue.destination as? AddRecipeViewController
            let passRecipe = allRecipes[indexPath.section].recipes[indexPath.row]
            
            secondViewController?.passedRecipe = passRecipe
        }
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


