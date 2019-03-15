//
//  UserTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    var sectionLayout: ExploreSection?
    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "UserTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "UserTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.horizontalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.horizontalCollectionView.register(UserCollectionViewCell.cellNib(), forCellWithReuseIdentifier: UserCollectionViewCell.cellReuseIdentifier)
        self.setCollectionViewFlowLayout()
        // Initialization code
    }
    
    func setCollectionViewFlowLayout(){
        self.horizontalCollectionView.showsHorizontalScrollIndicator = false
        self.horizontalCollectionView.showsVerticalScrollIndicator = false
        if let flow = horizontalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flow.sectionInset = UIEdgeInsets(top: 0.0, left: 15.0, bottom: 0.0, right: 15.0)
            flow.minimumLineSpacing = 20.0
            flow.itemSize =  CGSize(width: horizontalCollectionView.bounds.width/2, height: horizontalCollectionView.bounds.height)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionLayout?.entities.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.cellReuseIdentifier, for: indexPath) as! UserCollectionViewCell
        if let entity = self.sectionLayout?.entities[indexPath.item] as? UserEntities  {
            cell.lblFirstName.text = entity.firstName
            cell.lblLastName.text = entity.lastName
            cell.lblClapsCount.text =   (entity.totalProjectClaps != nil) ? "👏 " +  "\(entity.totalProjectClaps!)" : ""
            cell.imageViewUser.sd_setImage(with: URL(string: entity.imageUrl ?? ""), placeholderImage: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height)
    }
}
