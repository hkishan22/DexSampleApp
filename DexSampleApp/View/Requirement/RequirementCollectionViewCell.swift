//
//  RequirementCollectionViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class RequirementCollectionViewCell: UICollectionViewCell {

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "RequirementCollectionViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "RequirementCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
