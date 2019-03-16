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
    @IBOutlet weak var userView:   UserView!
    
    var viewModel : UserSectionViewModel! {
        didSet {
            self.userView.lblFirstName.text = viewModel.firstName
            self.userView.lblLastName.text = viewModel.lastName
            self.userView.lblClapsCount.text =  viewModel.clapsCountText
            self.userView.imageViewUser.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""), placeholderImage: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
