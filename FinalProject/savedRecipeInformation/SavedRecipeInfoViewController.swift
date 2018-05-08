//
//  SavedRecipeInfoViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit
import CoreData
class SavedRecipeInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var passedRecipe: Recipe!
    var passedMealType: String?
    var recipe: [Recipes] = []
    var ingredients: [Ingredients] = []
    var filteredIngredient: [Ingredients] = []
    
    func uniqueElementsFrom(array: [Ingredients]) -> [Ingredients]{
        var set = Set<Ingredients>()
        var unique = [Ingredients]()
        for uniqueIngredients in array{
            if !set.contains(uniqueIngredients){
                unique.append(uniqueIngredients)
                set.insert(uniqueIngredients)
            }
        }
        return unique
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(tabBar.selectedSegmentIndex){
        case 0:
            return filteredIngredient.count
        case 1:
            return direction.count
        default:
            return 1
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBOutlet weak var foodName: UINavigationItem!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! SavedRecipeInfoTableViewCell
        switch(tabBar.selectedSegmentIndex){
        case 0:
            cell.ingredientName.text = filteredIngredient[indexPath.row].name
            cell.servingSize.text = ("\(filteredIngredient[indexPath.row].quantity!) \(filteredIngredient[indexPath.row].units!)")
        case 1:
            cell.ingredientName.text = direction[indexPath.row]
            cell.servingSize.text = " "
        case 2:
            cell.ingredientName.text = foodDescription
            cell.servingSize.text = " "
        default:
            break
        }
        return cell
    }
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var tabBar: UISegmentedControl!
    @IBOutlet weak var servingSizeLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    var direction: [String] = []
    var hugeDirection: String = ""
    var imageString: String = " "
    var foodDescription: String = ""
    var servingSize: String = " "
    var foodname: String = " "
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        ingredientTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        foodName.title = foodname
        ingredients = uniqueElementsFrom(array: ingredients)
        for uniqueIngredient in ingredients{
            if(foodname == uniqueIngredient.recipe?.name && uniqueIngredient.recipe?.name != nil){
                filteredIngredient.append(uniqueIngredient)
            }
            filteredIngredient = uniqueElementsFrom(array: filteredIngredient)
        }
        direction = hugeDirection.components(separatedBy: "/")
        if let url = NSURL(string: imageString){
            if let data = NSData(contentsOf: url as URL){
                foodImage.image = UIImage(data: data as Data)
            }
        }
        servingSizeLabel.text = "Serving Size: \(servingSize)"
        // Do any additional setup after loading the view.
    }

    @IBAction func deleteRecipe(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequet = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipes")
        do{
            let result = try managedContext.fetch(fetchRequet)
            
            recipe = result as! [Recipes]
            
            for recipe in recipe{
                if(foodname == recipe.name!){
                    managedContext.delete(recipe)
                }
            }
             try managedContext.save()
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
            
        }catch{
            print("Could not delete")
        }
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
