//
//  HorizontalTableViewCell.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class HorizontalTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var sectionLayoutVM: LayoutViewModel! {
        didSet {
            self.setCollectionViewFlowLayout()
        }
    }
    var sectionNavHandler:SectionNavigationHandler?
    
    var collectionCellDataSource : HorizontalCollectionCellDataSource! {
        didSet {
            self.registerCell()
            self.setCollectionViewFlowLayout()
            self.horizontalCollectionView.reloadData()
        }
    }
    
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
    }

    func setCollectionViewFlowLayout(){
        self.collectionCellDataSource?.setFlowLayout(collectionView: self.horizontalCollectionView)
    }
    
    func registerCell(){
        self.collectionCellDataSource?.registerCell(collectionView: self.horizontalCollectionView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionLayoutVM?.sectionViewModels.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        return  self.collectionCellDataSource?.cell(collectionView: collectionView, viewModel: self.sectionLayoutVM!.sectionViewModels[indexPath.item], indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sectionNavHandler?.handleAction(sectionType: self.sectionLayoutVM!.type, sectionViewModel: self.sectionLayoutVM!.sectionViewModels[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.collectionCellDataSource?.sizeForItemAt(collectionView: collectionView) ?? CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.collectionCellDataSource?.minimumLineSpacingForSectionAt() ?? 0.0
    }
    
}


