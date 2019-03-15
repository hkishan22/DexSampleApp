//
//  HorizontalTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class HorizontalTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var sectionLayout: ExploreSection?
    var sectionNavHandler:SectionNavigationHandler?
    
    
    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "HorizontalTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "HorizontalTableViewCell"
    
    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.horizontalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.setCollectionViewFlowLayout()
        self.registerCell()
    }

    func setCollectionViewFlowLayout(){
    
    }
    
    func registerCell(){
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionLayout?.entities.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellReuseIdentifier, for: indexPath) as! BannerCollectionViewCell
        if let entity = self.sectionLayout?.entities[indexPath.item] as? BannerEntities, let urlString = entity.imageUrl  {
            cell.imgv_bannerImage.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let entity = self.sectionLayout?.entities[indexPath.item] as? BannerEntities  {
         //   self.sectionNavHandler?.handleAction(sectionType:.Banner,entity: entity, title: "Banner")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}


protocol HorizontalCellDatatSource {
    func registerCell(collectionView:UICollectionView)
    func setFlowLayout(collectionView:UICollectionView)
    func numberOfItems()->Int
    func cell(indexPath: IndexPath)->UICollectionViewCell
    func sizeForItemAt(indexPath: IndexPath)->CGSize
}
