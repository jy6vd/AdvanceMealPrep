//
//  IngredientViewController.swift
//  FinalProject
//
//  Created by Landen Eagan on 5/6/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class IngredientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["bacon", "onion", "extra-virgin olive oil", "egg", "pesto", "pita bread round", "tomato", "mushrooms"]
    let list2 = ["4 slices", "1/4 onion", "2 tablespoons", "4 eggs", "2 tablespoons", "2 slices", "1/2 tomato", "1/4 cup"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IngredientTableViewCell
        
        cell.label.text = list[indexPath.row]
        cell.label2.text = list2[indexPath.row]
        
        return(cell)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
