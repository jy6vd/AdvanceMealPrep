//
//  AddRecipeViewController.swift
//  FinalProject
//
//  Created by Hayden on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit
import CoreData
class AddRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var passedRecipe: Recipe!
    var passedMealType: String?
    var hugeDirection: String = ""
    
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
        case 1:
            cell.ingredientName.text = passedRecipe.directions[indexPath.row]
            hugeDirection = passedRecipe.directions.joined(separator: "/")
            foodTitle.title = passedRecipe.title
            cell.servingSize.text = " "
        case 2:
            cell.ingredientName.text = passedRecipe.description
            foodTitle.title = passedRecipe.title
            cell.servingSize.text = " "
        default:
            break
        }
        if let url = NSURL(string: passedRecipe.picture){
            if let data = NSData(contentsOf: url as URL){
                foodImage.image = UIImage(data: data as Data)
            }
        }
        servingSizeLabel.text = "Serving Size: \(passedRecipe.servingSize)"
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipes", in: context)
        let entity2 = NSEntityDescription.entity(forEntityName: "Ingredients", in: context)
        let recipe = NSManagedObject(entity: entity!, insertInto: context)
            recipe.setValue(passedRecipe.title, forKey: "name")
            recipe.setValue(passedRecipe.description, forKey: "descriptions")
            recipe.setValue(passedMealType, forKey: "meal")
            recipe.setValue(passedRecipe.servingSize, forKey: "serving")
            recipe.setValue(hugeDirection, forKey: "direction")
            recipe.setValue(passedRecipe.picture, forKey: "picture")

        for x in passedRecipe.ingredients{
             let ingredient = NSManagedObject(entity: entity2!, insertInto: context)
            ingredient.setValue(x.title, forKey: "name")
            ingredient.setValue(x.quantity, forKey: "quantity")
            ingredient.setValue(x.units, forKey: "units")
            ingredient.setValue(recipe, forKey: "recipe")
        }
        do{
            try context.save()
            
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        }
        catch{
            print("Could not save recipe")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        
        
         hugeDirection = passedRecipe.directions.joined(separator: "/")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
