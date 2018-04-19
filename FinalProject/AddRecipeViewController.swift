//
//  AddRecipeViewController.swift
//  FinalProject
//
//  Created by Hayden on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit
class AddRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var ingredients: [String] = ["Onion", "Apple Juice", "Salt", "Pepper", "Olive oil"]
    var servingsize: [String] = ["1 fl oz","2 tbs","3 cups","4 tsp","5 pint"];
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientDisplayTableViewCell", for: indexPath) as! IngredientDisplayTableViewCell
        cell.ingredientName.text = ingredients[indexPath.row]
        cell.servingSize.text = servingsize[indexPath.row]

        return cell
    }
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var tabBar: UISegmentedControl!
    @IBOutlet weak var servingSizeLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    
    
    
    
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
