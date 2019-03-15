//
//  BannerCollectionViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "BannerCollectionViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "BannerCollectionViewCell"
    
    @IBOutlet weak var imgv_bannerImage:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
