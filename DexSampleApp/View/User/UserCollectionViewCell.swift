//
//  UserCollectionViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "UserCollectionViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "UserCollectionViewCell"

    @IBOutlet weak var lblFirstName:    UILabel!
    @IBOutlet weak var lblLastName:     UILabel!
    @IBOutlet weak var lblClapsCount:   UILabel!
    @IBOutlet weak var imageViewUser:   RoundImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
