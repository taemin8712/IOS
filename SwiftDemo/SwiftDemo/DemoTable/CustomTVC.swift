//
//  CustomTVC.swift
//  SwiftDemo
//
//  Created by taemmy on 2020/08/25.
//  Copyright © 2020 tm. All rights reserved.
//

import UIKit

class CustomTVC: UITableViewCell {

    @IBOutlet weak var m_vwCell: UIView!
    @IBOutlet weak var m_lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
