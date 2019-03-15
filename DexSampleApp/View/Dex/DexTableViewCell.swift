//
//  DexTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    var sectionLayout: ExploreSection?
    var sectionNavHandler:SectionNavigationHandler?

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "DexTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "DexTableViewCell"
    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.horizontalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.horizontalCollectionView.register(DexCollectionViewCell.cellNib(), forCellWithReuseIdentifier: DexCollectionViewCell.cellReuseIdentifier)
        self.setCollectionViewFlowLayout()
    }
    
    func setCollectionViewFlowLayout(){
        self.horizontalCollectionView.showsHorizontalScrollIndicator = false
        self.horizontalCollectionView.showsVerticalScrollIndicator = false
        if let flow = horizontalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flow.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 15.0)
            flow.minimumLineSpacing = 10.0
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DexCollectionViewCell.cellReuseIdentifier, for: indexPath) as! DexCollectionViewCell
        if let entities = self.sectionLayout?.entities, entities.count > indexPath.item, let entity = self.sectionLayout?.entities[indexPath.item] as? DexEntites{
            cell.lblTitle.text = entity.userTerm
            cell.imageViewDexBG.sd_setImage(with: URL(string: entity.imageUrl ?? ""), placeholderImage: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let entity = self.sectionLayout?.entities[indexPath.item] as? DexEntites  {
            self.sectionNavHandler?.handleAction(sectionType:.Dex,entity: entity, title: "Dex")
        }
    }
}
