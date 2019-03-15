//
//  DexTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexTableViewCell: UITableViewCell {

    var sectionLayout: ExploreSection?

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "DexTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "DexTableViewCell"
    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
