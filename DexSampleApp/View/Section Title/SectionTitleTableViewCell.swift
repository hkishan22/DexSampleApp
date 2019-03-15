//
//  SectionTitleTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SectionTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    
    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "SectionTitleTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "SectionTitleTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
