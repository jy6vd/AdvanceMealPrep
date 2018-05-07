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
    
    var filteredRecipes = [Recipe]()
    
    var allRecipeToFilter = [Recipe]()
    
    var passDay: String = ""
    
    var isSearchingRecipe = false
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        searchBar.delegate = self
        addRecipeToFilter()
        searchBar.returnKeyType = UIReturnKeyType.done

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if(isSearchingRecipe){
            return 1
        }else{
             return allRecipes.count
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(isSearchingRecipe){
            return nil
        }else{
            return allRecipes[section].mealType
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isSearchingRecipe){
            return filteredRecipes.count
        }
        return allRecipes[section].recipes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        if(isSearchingRecipe){
            cell.foodTitle.text = filteredRecipes[indexPath.row].title
            cell.foodDescription.text = filteredRecipes[indexPath.row].description
            if let url = NSURL(string: filteredRecipes[indexPath.row].picture){
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearchingRecipe = false

            recipeTableView.reloadData()
            
        } else {
            isSearchingRecipe = true
            filteredRecipes = allRecipeToFilter.filter{ $0.title.lowercased().contains(searchText.lowercased()) }
             recipeTableView.reloadData()
            }
    }
    func addRecipeToFilter(){
        var num = 0
        for recipe in allRecipes{
            for uniqueRecipe in recipe.recipes{
                allRecipeToFilter.append(uniqueRecipe)
                num = num + 1
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewRecipeSegue"{
            let indexPath = self.recipeTableView.indexPathForSelectedRow!
            let secondViewController = segue.destination as? AddRecipeViewController
            let passRecipe = allRecipes[indexPath.section].recipes[indexPath.row]
            let passMealType = allRecipes[indexPath.section].mealType
            
            let passDay: String?
            passDay = self.passDay
            secondViewController?.passDay = passDay!
            
            secondViewController?.passedMealType = passMealType
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


