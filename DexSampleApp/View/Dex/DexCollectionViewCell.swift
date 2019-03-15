//
//  DexCollectionViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle:   UILabel!
    @IBOutlet weak var imageViewDexBG:   UIImageView!

    
    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "DexCollectionViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "DexCollectionViewCell"

    
    
    var viewModel: DexSectionViewModel! {
        didSet {
            self.lblTitle.text = viewModel.title
            self.imageViewDexBG.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""), placeholderImage: nil)

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
