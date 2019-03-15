//
//  DexCollectionViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexCollectionViewCell: UICollectionViewCell {

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "DexCollectionViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "DexCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
