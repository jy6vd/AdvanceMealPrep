//
//  RecipeDisplayTableViewCell.swift
//  FinalProject
//
//  Created by Hayden on 4/19/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class IngredientDisplayTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var servingSize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
