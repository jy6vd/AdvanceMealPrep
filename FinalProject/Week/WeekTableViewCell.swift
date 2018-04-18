//
//  WeekTableViewCell.swift
//  FinalProject
//
//  Created by Jonathan Yee on 4/3/18.
//  Copyright © 2018 Jonathan Yee. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {

    @IBOutlet weak var days: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
