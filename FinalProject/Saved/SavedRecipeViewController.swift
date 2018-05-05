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
    
    @IBOutlet weak var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        //let fetchRequest: NSFetchRequest<Recipes> = Recipes.fetchRequest()
        let fetchRequet = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipes")
        let fetchRequet2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Ingredients")
        //fetchRequet2.resultType = .managedObjectResultType
            do{
//            recipes = try managedContext.fetch(fetchRequest)
            let result = try managedContext.fetch(fetchRequet)
            let result2 = try managedContext.fetch(fetchRequet2)
            for data in result2{
                print((data as AnyObject).value(forKey: "name") ?? " ",(data as AnyObject).value(forKey: "quantity") ?? " ",(data as AnyObject).value(forKey: "units") ?? " ")
            }
            recipes = result as! [Recipes]
            seperateRecipes()
        }
        catch{
            print("Could not fetch")
        }
    }
    func seperateRecipes(){
        for recipe in recipes{
//            switch recipe.meal{
//                case "breakfast":
//                    breakfast.append(recipe)
//                case "lunch":
//                    lunch.append(recipe)
//                case "dinner":
//                    dinner.append(recipe)
//                case "dessert":
//                    dessert.append(recipe)
//                default:
//                    snack.append(recipe)
//            }
            if(recipe.meal! == "breakfast"){
                breakfast.append(recipe)
                print("breakfast count: \(breakfast.count)")
                print("Recipe meal: \(recipe.meal!)")
            }
            else if(recipe.meal! == "lunch"){
                lunch.append(recipe)
                 print("lunch count: \(lunch.count)")
            }
            else if(recipe.meal! == "dinner"){
                dinner.append(recipe)
                 print("dinner count: \(dinner.count)")
            }else if(recipe.meal! == "dessert"){
                dessert.append(recipe)
                print("dessert count: \(dessert.count)")
            }else{
                snack.append(recipe)
                 print("snack count: \(snack.count)")
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
        var set = Set<Recipes>()
        let result = array.filter{
            guard !set.contains($0) else{
                return false
            }
            set.insert($0)
            return true
        }
        return result
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
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return
//    }
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
                print("breakfast")
                case 1:
                        print(indexPath.row)
                        cell.foodTitle.text = lunch[indexPath.row].name
                        cell.foodDescription.text = lunch[indexPath.row].descriptions
                        if let url = NSURL(string: lunch[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                        }
                    print("lunch")
                case 2:
                        cell.foodTitle.text = dinner[indexPath.row].name
                        cell.foodDescription.text = dinner[indexPath.row].descriptions
                        if let url = NSURL(string: dinner[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                        }
                    print("dinner")
                case 3:
                        cell.foodTitle.text = dessert[indexPath.row].name
                        cell.foodDescription.text = dessert[indexPath.row].descriptions
                        if let url = NSURL(string: dessert[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                    cell.foodImage.image = UIImage(data: data as Data)
                                }
                            }
                    print("dessert")
                default:
                        cell.foodTitle.text = snack[indexPath.row].name
                        cell.foodDescription.text = snack[indexPath.row].descriptions
                        if let url = NSURL(string: snack[indexPath.row].picture!){
                            if let data = NSData(contentsOf: url as URL){
                                cell.foodImage.image = UIImage(data: data as Data)
                            }
                        }
                    print("snack")
            }
       }
       
        //cell.foodImage.image = UIImage(named: "donut")
        return cell
}
    

    @IBAction func addRecipe(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addRecipeSegue", sender: self)
    }

    //func deleteCellRow(_ sender: SavedRecipeTableViewCell){
      //  guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        // Delete the row
        //meal_array.remove(at: tappedIndexPath.row)
        //tableView.deleteRows(at: [tappedIndexPath], with: .automatic)

        
    //}
    
   // override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     //   if editingStyle == UITableViewCellEditingStyle.Delete {
       //     numbers.removeAtIndex(indexPath.row)
        //    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
       // }
   // }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            meal_array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }*/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteRecipe(at: indexPath)
//            switch indexPath.section{
//                case 0:
//                    breakfast.remove(at: indexPath.row)
//                    break
//                case 1:
//                    lunch.remove(at: indexPath.row)
//                    break
//                case 2:
//                    dinner.remove(at: indexPath.row)
//                    break
//                case 3:
//                    dessert.remove(at: indexPath.row)
//                default:
//                    snack.remove(at: indexPath.row)
//                    break
//            }
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
            secondViewController?.foodTitle.title = passName
            secondViewController?.hugeDirection = passDirection!
            secondViewController?.foodDescription = pasDescription!
            //secondViewController?.ingredients = recipes[indexPath.row].ingredients!
//            secondViewController?.
            
    }
}
    func deleteRecipe(at indexPath: IndexPath){
        let recipe = recipes[indexPath.row]
        
        guard let managedContext = recipe.managedObjectContext else{
            return
        }
        managedContext.delete(recipe)
        
        do{
            try managedContext.save()
            
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
