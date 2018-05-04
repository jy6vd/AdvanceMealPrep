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
        switch(tabBar.selectedSegmentIndex){
        case 0:
            return ingredients.count
        case 1:
            return direction.count
        default:
            return 1
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! SavedRecipeInfoTableViewCell
        switch(tabBar.selectedSegmentIndex){
        case 0:
            //cell.ingredientName.text = ingredient
            //cell.servingSize.text = servingSizeLabel.text
            foodTitle.title = foodTitle.title
        case 1:
            cell.ingredientName.text = direction[indexPath.row]
            foodTitle.title = foodTitle.title
            cell.servingSize.text = " "
        case 2:
            cell.ingredientName.text = foodDescription
            foodTitle.title = foodTitle.title
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
    var direction: [String] = []
    var hugeDirection: String = ""
    var imageString: String = " "
    var foodDescription: String = ""
    var servingSize: String = " "
    var ingredients: [Ingredients] = []

    
    @IBAction func removeRecipe(_ sender: Any) {
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        ingredientTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        direction = hugeDirection.components(separatedBy: "/")
        if let url = NSURL(string: imageString){
            if let data = NSData(contentsOf: url as URL){
                foodImage.image = UIImage(data: data as Data)
            }
        }
        servingSizeLabel.text = "Serving Size: \(servingSize)"
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
