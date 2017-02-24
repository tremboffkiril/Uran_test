//
//  SecondCell.swift
//  Uran_test
//
//  Created by Kiril Trembovetskiy on 2/24/17.
//  Copyright © 2017 Kiril Trembovetskiy. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {

    @IBOutlet weak var lDateMod: UILabel!
    @IBOutlet weak var lFileName: UILabel!
    @IBOutlet weak var vOrange: UIView!
    @IBOutlet weak var vBlue: UIView!
    @IBOutlet weak var imType: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
