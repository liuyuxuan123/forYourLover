//
//  forYourLoveTableViewCell.swift
//  forYourLover
//
//  Created by 刘宇轩 on 16/4/14.
//  Copyright © 2016年 刘宇轩. All rights reserved.
//

import UIKit

class forYourLoveTableViewCell: UITableViewCell {

    @IBOutlet weak var classifyImage: UIView!
    @IBOutlet weak var missonNaneLabel: UILabel!
    @IBOutlet weak var missonRemainTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
