//
//  IngredientViewController.swift
//  FinalProject
//
//  Created by Landen Eagan on 5/6/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class IngredientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Milk", "Honey", "Bread", "Tacos", "Tomatoes"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IngredientTableViewCell
        
        cell.label.text = list[indexPath.row]
        
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
