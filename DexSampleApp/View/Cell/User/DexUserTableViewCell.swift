//
//  DexUserTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexUserTableViewCell: UITableViewCell {

    @IBOutlet weak var userView:   UserView!

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "DexUserTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "DexUserTableViewCell"
    
    var viewModel : DexUserViewModel! {
        didSet {
            self.userView.lblFirstName.text = viewModel.firstName
            self.userView.lblLastName.text = viewModel.lastName
            self.userView.lblClapsCount.text =   (viewModel.clapsCountText != nil) ? "👏 " +  "\(viewModel.clapsCountText!)" : ""
            self.userView.imageViewUser.sd_setImage(with: URL(string: viewModel.imageUrl ?? ""), placeholderImage: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
