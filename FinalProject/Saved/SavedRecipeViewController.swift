//
//  SavedRecipeViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class SavedRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var meal_type: [String] = ["Breakfast", "Lunch", "Dinner", "Snack"]
    var breakfast_array: [String] = ["Donut", "Ceral", "Yogurt", "hashbrown"]
    var lunch_array: [String] = ["Salad", "Pasta", "Pizza", "Burger"]
    var dinner_array: [String] = ["Chicken", "Steak", "Lamb", "Burger"]
    var snack_array: [String] = ["Cake", "Cookie", "Pretzel", "Candy"]
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
           return breakfast_array.count
        case 1:
           return lunch_array.count
        case 2:
            return dinner_array.count
        default:
            return snack_array.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return meal_type.count
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return
//    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meal_type[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! SavedRecipeTableViewCell
        switch indexPath.section{
            case 0:
                cell.foodCalories.text = breakfast_array[indexPath.row]
                cell.foodTitle.text = breakfast_array[indexPath.row]
            case 1:
                cell.foodCalories.text = lunch_array[indexPath.row]
                cell.foodTitle.text = lunch_array[indexPath.row]
            case 2:
                cell.foodCalories.text = dinner_array[indexPath.row]
                cell.foodTitle.text = dinner_array[indexPath.row]
            default:
                cell.foodCalories.text = snack_array[indexPath.row]
                cell.foodTitle.text = snack_array[indexPath.row]
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
            switch indexPath.section{
                case 0:
                    breakfast_array.remove(at: indexPath.row)
                    break
                case 1:
                    lunch_array.remove(at: indexPath.row)
                    break
                case 2:
                    dinner_array.remove(at: indexPath.row)
                    break
                default:
                    snack_array.remove(at: indexPath.row)
                    break
            }
            //tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            tableView.reloadData()
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
