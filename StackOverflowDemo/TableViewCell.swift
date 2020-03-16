//
//  TableViewCell.swift
//  StackOverflowDemo
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var answerCount : UILabel!
    @IBOutlet weak var question : UILabel!
    @IBOutlet weak var tags : UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var btnOwner: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
