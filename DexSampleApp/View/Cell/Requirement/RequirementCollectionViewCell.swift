//
//  RequirementCollectionViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class RequirementCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblRequirement:   UILabel!
    @IBOutlet weak var lblLocation:   UILabel!
    @IBOutlet weak var imageViewDexBG:   UIImageView!

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "RequirementCollectionViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "RequirementCollectionViewCell"

    var viewModel: RequirementSectionViewModel! {
        didSet {
            self.lblRequirement.text = viewModel.requirementText
            self.lblLocation.text = viewModel.locationText
            self.imageViewDexBG.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""), placeholderImage: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
