//
//  SavedRecipeInfoViewController.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class SavedRecipeInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var volume_units: [String] = ["tsp", "tbs", "fl oz", "cup", "pint", "quart", "gallon", "ml", "l"]
    var ingredients: [String] = ["Onion", "Apple Juice", "Salt", "Pepper", "Olive oil"]
    var servingsize: [String] = ["1 fl oz","2 tbs","3 cups","4 tsp","5 pint"];
    var directions: [String] = [
        "Heat up pan",
        "Pour olive oil in",
        "Chopped onion",
        "Add salt and pepper",
        "Cook for 15 mins"
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        switch(tabBar.selectedSegmentIndex){
        case 0:
            count = ingredients.count
        case 1:
            count = directions.count
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
            cell.ingredientName.text = ingredients[indexPath.row]
            foodTitle.title = ingredients[indexPath.row]
            cell.servingSize.text = servingsize[indexPath.row]
        case 1:
            cell.ingredientName.text = directions[indexPath.row]
            foodTitle.title = ingredients[indexPath.row]
            cell.servingSize.text = " "
        default:
            break
        }
        return cell
    }
    
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
        
        foodImage.image = UIImage(named: "donut")
        servingSizeLabel.text = "Serving size: 1"
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
