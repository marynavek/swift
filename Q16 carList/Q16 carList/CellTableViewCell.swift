//
//  CellTableViewCell.swift
//  Q16 carList
//
//  Created by Maryna Veksler on 1/2/20.
//  Copyright © 2020 Maryna Veksler. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var carModel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
