//
//  RequirementTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class RequirementTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var sectionLayout: ExploreSection?
    
    
    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "RequirementTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "RequirementTableViewCell"
    
    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.horizontalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.horizontalCollectionView.register(RequirementCollectionViewCell.cellNib(), forCellWithReuseIdentifier: RequirementCollectionViewCell.cellReuseIdentifier)
        self.setCollectionViewFlowLayout()
    }
    
    func setCollectionViewFlowLayout(){
        self.horizontalCollectionView.showsHorizontalScrollIndicator = false
        self.horizontalCollectionView.showsVerticalScrollIndicator = false
        if let flow = horizontalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flow.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            flow.minimumLineSpacing = 10.0
            flow.itemSize =  CGSize(width: horizontalCollectionView.bounds.width * 0.85, height: horizontalCollectionView.bounds.height)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RequirementCollectionViewCell.cellReuseIdentifier, for: indexPath) as! RequirementCollectionViewCell
        if let entity = self.sectionLayout?.entities[indexPath.item] as? RequirementEntities  {
            cell.lblRequirement.text = (entity._dex?.userTerm != nil) ? "\(entity._dex!.userTerm!) Required" : ""
            cell.lblLocation.text = (entity.creator?.firstName != nil) ? "Anywhere in the world - by \(entity.creator!.firstName! + entity.creator!.lastName!)" : ""
            cell.imageViewDexBG.sd_setImage(with: URL(string: entity._dex?.imageUrl ?? ""), placeholderImage: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.85, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
}
