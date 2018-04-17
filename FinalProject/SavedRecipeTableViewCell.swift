//
//  SavedRecipeTableViewCell.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/17/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class SavedRecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodCalories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
