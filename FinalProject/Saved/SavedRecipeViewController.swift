//
//  SavedRecipeViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit
import CoreData

class SavedRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var meal_type: [String] = ["Breakfast", "Lunch", "Dinner", "Dessert", "Snack"]
    var breakfast: [Recipes] = []
    var lunch: [Recipes] = []
    var dinner: [Recipes] = []
    var dessert: [Recipes] = []
    var snack: [Recipes] = []
    var recipes: [Recipes] = []
    var ingredients: [Ingredients] = []
    var recipeWithIngredient: [AnyObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest2: NSFetchRequest<Ingredients> = Ingredients.fetchRequest()
        let fetchRequet = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipes")
            do{
//            recipes = try managedContext.fetch(fetchRequest)
            let result = try managedContext.fetch(fetchRequet)
            //let result2 = try managedContext.fetch(fetchRequest2)
                
            ingredients = try managedContext.fetch(fetchRequest2)
            //for data in result2{
                //print((data as AnyObject).value(forKey: "name") ?? " ",(data as AnyObject).value(forKey: "quantity") ?? " ",(data as AnyObject).value(forKey: "units") ?? " ")
            //}
            recipes = result as! [Recipes]
            //ingredients = result2
                for uniqueIngredients in ingredients{
                    print(uniqueIngredients.name!)
                }
            
            seperateRecipes()
        }
        catch{
            print("Could not fetch")
        }
    }
    func seperateRecipes(){
        for recipe in recipes{
            
            if(recipe.meal! == "breakfast"){
                breakfast.append(recipe)
            }
            else if(recipe.meal! == "lunch" ){
                lunch.append(recipe)
            }
            else if(recipe.meal! == "dinner" ){
                dinner.append(recipe)
            }else if(recipe.meal! == "dessert" ){
                dessert.append(recipe)
            }else if (recipe.meal! == "snack" ){
                snack.append(recipe)
            }
        }
        breakfast = uniqueElementsFrom(array: breakfast)
        lunch = uniqueElementsFrom(array: lunch)
        dinner = uniqueElementsFrom(array: dinner)
        dessert = uniqueElementsFrom(array: dessert)
        snack = uniqueElementsFrom(array: snack)
        
        tableView.reloadData()
        
    }
    func uniqueElementsFrom(array: [Recipes]) -> [Recipes]{

        var set = Set<String>()
        var unique = [Recipes]()
        for uniqueRecipe in array{
            if !set.contains(uniqueRecipe.name!){
                unique.append(uniqueRecipe)
                set.insert(uniqueRecipe.name!)
            }
        }
        return unique
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return breakfast.count
        case 1:
            return lunch.count
        case 2:
            return dinner.count
        case 3:
            return dessert.count
        case 4:
            return snack.count
        default:
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
            return meal_type.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(!recipes.isEmpty){
            return meal_type[section]
        }
        else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! SavedRecipeTableViewCell
        if(recipes.count > 0){
            switch(indexPath.section){
                case 0:
                        cell.foodTitle.text = breakfast[indexPath.row].name
                        cell.foodDescription.text = breakfast[indexPath.row].descriptions
                        if let url = NSURL(string: breakfast[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                        }
                case 1:
                        print(indexPath.row)
                        cell.foodTitle.text = lunch[indexPath.row].name
                        cell.foodDescription.text = lunch[indexPath.row].descriptions
                        if let url = NSURL(string: lunch[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                        }
                case 2:
                        cell.foodTitle.text = dinner[indexPath.row].name
                        cell.foodDescription.text = dinner[indexPath.row].descriptions
                        if let url = NSURL(string: dinner[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                    }
                case 3:
                        cell.foodTitle.text = dessert[indexPath.row].name
                        cell.foodDescription.text = dessert[indexPath.row].descriptions
                        if let url = NSURL(string: dessert[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                    cell.foodImage.image = UIImage(data: data as Data)
                                }
                            }
                default:
                        cell.foodTitle.text = snack[indexPath.row].name
                        cell.foodDescription.text = snack[indexPath.row].descriptions
                        if let url = NSURL(string: snack[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                        }
            }
       }
        return cell
    }
    

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteRecipe(at: indexPath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savedRecipeSegue"{
            let indexPath = self.tableView.indexPathForSelectedRow!
            let sectionNumber = indexPath.section
            let secondViewController = segue.destination as? SavedRecipeInfoViewController
            let passName: String?
            let passDirection: String?
            let pasDescription: String?
            let passImage: String?
            let passServing: String?
            switch sectionNumber{
            case 0:
                passName = breakfast[indexPath.row].name
                passDirection = breakfast[indexPath.row].direction
                pasDescription = breakfast[indexPath.row].descriptions
                passImage = breakfast[indexPath.row].picture
                passServing = breakfast[indexPath.row].serving
            case 1:
                passName = lunch[indexPath.row].name
                passDirection = lunch[indexPath.row].direction
                pasDescription = lunch[indexPath.row].descriptions
                passImage = lunch[indexPath.row].picture
                passServing = lunch[indexPath.row].serving
            case 2:
                passName = dinner[indexPath.row].name
                passDirection = dinner[indexPath.row].direction
                pasDescription = dinner[indexPath.row].descriptions
                passImage = dinner[indexPath.row].picture
                passServing = dinner[indexPath.row].serving
            case 3:
                passName = dessert[indexPath.row].name
                passDirection = dessert[indexPath.row].direction
                pasDescription = dessert[indexPath.row].descriptions
                passImage = dessert[indexPath.row].picture
                passServing = dessert[indexPath.row].serving
            default:
                 passName = snack[indexPath.row].name
                 passDirection = snack[indexPath.row].direction
                 pasDescription = snack[indexPath.row].descriptions
                 passImage = snack[indexPath.row].picture
                 passServing = snack[indexPath.row].serving
            }
            
            secondViewController?.imageString = passImage!
            secondViewController?.servingSize = passServing!
            secondViewController?.foodname = passName!
            secondViewController?.hugeDirection = passDirection!
            secondViewController?.foodDescription = pasDescription!
            secondViewController?.ingredients = ingredients

            
    }
}
    func deleteRecipe(at indexPath: IndexPath){
        let recipe = recipes[indexPath.row]
        //var num = 0
        guard let managedContext = recipe.managedObjectContext else{
            return
        }
        managedContext.delete(recipe)
        
        do{
            try managedContext.save()
            
            for ingredientRecipe in ingredients{
                if(ingredientRecipe.recipe?.name == recipe.name){
                    managedContext.delete(ingredientRecipe)
                }
                //num = num + 1
            }
            recipes.remove(at: indexPath.row)
            switch indexPath.section{
            case 0:
                breakfast.remove(at: indexPath.row)
                break
            case 1:
                lunch.remove(at: indexPath.row)
                break
            case 2:
                dinner.remove(at: indexPath.row)
                break
            case 3:
                dessert.remove(at: indexPath.row)
            default:
                snack.remove(at: indexPath.row)
                break
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }catch{
            print("Could not delete")
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
