//
//  BannerTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit



class BannerTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var sectionNavHandler:SectionNavigationHandler?
    var sectionLayoutVM: LayoutViewModel?

    

    static func cellNib() -> UINib {
        let nib = UINib.init(nibName: "BannerTableViewCell", bundle: nil)
        return nib
    }
    
    static let cellReuseIdentifier = "BannerTableViewCell"
    
    @IBOutlet weak var horizontalCollectionView: UICollectionView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.horizontalCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.horizontalCollectionView.register(BannerCollectionViewCell.cellNib(), forCellWithReuseIdentifier: BannerCollectionViewCell.cellReuseIdentifier)
        self.setCollectionViewFlowLayout()
    }
    
    func setCollectionViewFlowLayout(){
        let collectionViewLayout = CenteredCollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )// some UIEdgeInset
        collectionViewLayout.minimumInteritemSpacing = 0.0
        collectionViewLayout.minimumLineSpacing = 0.0
        collectionViewLayout.invalidateLayout()
        let itemWidth = (horizontalCollectionView.bounds.width)
        let itemHeight = (horizontalCollectionView.bounds.width * 2)/3
        let size = CGSize(width: itemWidth, height: itemHeight)
        collectionViewLayout.itemSize = size
        self.horizontalCollectionView.isPagingEnabled = true
        self.horizontalCollectionView.collectionViewLayout = collectionViewLayout
        collectionViewLayout.scrollDirection = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionLayoutVM?.sectionViewModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellReuseIdentifier, for: indexPath) as! BannerCollectionViewCell
        if let viewModel = self.sectionLayoutVM?.sectionViewModels[indexPath.item] as? BannerSectionViewModel   {
            cell.viewModel = viewModel
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewModel = self.sectionLayoutVM?.sectionViewModels[indexPath.item] as? BannerSectionViewModel   {
            self.sectionNavHandler?.handleAction(sectionType: self.sectionLayoutVM!.type, sectionViewModel: viewModel, title: "Banner")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
