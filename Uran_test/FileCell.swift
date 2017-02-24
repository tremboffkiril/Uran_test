//
//  FileCell.swift
//  Uran_test
//
//  Created by Kiril Trembovetskiy on 2/24/17.
//  Copyright © 2017 Kiril Trembovetskiy. All rights reserved.
//

import UIKit

class FileCell: UITableViewCell {

    @IBOutlet weak var lModDate: UILabel!
    @IBOutlet weak var lFileName: UILabel!
    @IBOutlet weak var imTypeFile: UIImageView!
    @IBOutlet weak var vBlue: UIView!
    @IBOutlet weak var vOrange: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
