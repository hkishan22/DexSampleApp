//
//  DexUserTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexUserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFirstName:    UILabel!
    @IBOutlet weak var lblLastName:     UILabel!
    @IBOutlet weak var lblClapsCount:   UILabel!
    @IBOutlet weak var imageViewUser:   RoundImageView!

    
    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "DexUserTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "DexUserTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
