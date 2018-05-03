//
//  SavedRecipeInfoViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit
class SavedRecipeInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var passedRecipe: Recipe!
    var passedMealType: String?
    
    var hugeDirection: String = ""

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 0
        switch(tabBar.selectedSegmentIndex){
        case 0:
            return passedRecipe.ingredients.count
        case 1:
            return passedRecipe.directions.count
        default:
            break
        }
        return count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! SavedRecipeInfoTableViewCell
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
        return cell    }
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var tabBar: UISegmentedControl!
    @IBOutlet weak var servingSizeLabel: UILabel!
    @IBOutlet weak var foodTitle: UINavigationItem!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    @IBAction func removeRecipe(_ sender: Any) {
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        ingredientTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        
        
        
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
