//
//  AddRecipeViewController.swift
//  FinalProject
//
//  Created by Hayden on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit
class AddRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var passedRecipe: Recipe!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(tabBar.selectedSegmentIndex){
        case 0:
            return passedRecipe.ingredients.count
        case 1:
            return passedRecipe.directions.count
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientDisplayTableViewCell
        switch(tabBar.selectedSegmentIndex){
        case 0:
            cell.ingredientName.text = passedRecipe.ingredients[indexPath.row].title
            cell.servingSize.text = "\(passedRecipe.ingredients[indexPath.row].quantity) \(passedRecipe.ingredients[indexPath.row].units)"
            foodTitle.title = passedRecipe.title
            cell.servingSize.text = passedRecipe.servingSize
        case 1:
            cell.ingredientName.text = passedRecipe.directions[indexPath.row]
            foodTitle.title = passedRecipe.title
        case 2:
            cell.ingredientName.text = passedRecipe.description
            foodTitle.title = passedRecipe.title
        default:
            break
        }
        return cell
    }
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var tabBar: UISegmentedControl!
    @IBOutlet weak var servingSizeLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var foodTitle: UINavigationItem!
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        ingredientTableView.reloadData()
    }
 
    @IBAction func saveRecipes(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
