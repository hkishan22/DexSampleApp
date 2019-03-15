//
//  HorizontalCollectionDataSource.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class HorizontalCollectionCellDataSource: CollectionCellDataSource {
 
    private var sectionType: SectionType =  .Unknown
    
    init(with type:SectionType) {
        self.sectionType = type
    }
    func registerCell(collectionView: UICollectionView) {
        switch self.sectionType {
        case .Requirement:
            collectionView.register(RequirementCollectionViewCell.cellNib(), forCellWithReuseIdentifier: RequirementCollectionViewCell.cellReuseIdentifier)
        case .Banner:
            collectionView.register(BannerCollectionViewCell.cellNib(), forCellWithReuseIdentifier: BannerCollectionViewCell.cellReuseIdentifier)
        case .User:
            collectionView.register(UserCollectionViewCell.cellNib(), forCellWithReuseIdentifier: UserCollectionViewCell.cellReuseIdentifier)
        case .Dex:
            collectionView.register(DexCollectionViewCell.cellNib(), forCellWithReuseIdentifier: DexCollectionViewCell.cellReuseIdentifier)
        case .Unknown:
            break
        }
    }
    
    func setFlowLayout(collectionView: UICollectionView) {
        switch self.sectionType {
        case .Requirement:
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            if let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
                flow.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                flow.minimumLineSpacing = 10.0
                flow.itemSize =  CGSize(width: collectionView.bounds.width * 0.85, height: collectionView.bounds.height)
            }

        case .Banner:
            let collectionViewLayout = CenteredCollectionViewFlowLayout()
            collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )// some UIEdgeInset
            collectionViewLayout.minimumInteritemSpacing = 0.0
            collectionViewLayout.minimumLineSpacing = 0.0
            collectionViewLayout.invalidateLayout()
            let itemWidth = (collectionView.bounds.width)
            let itemHeight = (collectionView.bounds.width * 2)/3
            let size = CGSize(width: itemWidth, height: itemHeight)
            collectionViewLayout.itemSize = size
            collectionView.isPagingEnabled = true
            collectionView.collectionViewLayout = collectionViewLayout
            collectionViewLayout.scrollDirection = .horizontal
       
        case .User:
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            if let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
                flow.sectionInset = UIEdgeInsets(top: 0.0, left: 15.0, bottom: 0.0, right: 15.0)
                flow.minimumLineSpacing = 20.0
                flow.itemSize =  CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height)
            }
       
        case .Dex:
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            if let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
                flow.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 15.0)
                flow.minimumLineSpacing = 10.0
                flow.itemSize =  CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height)
            }

        case .Unknown:
            break
        }
    }
    
    func cell(collectionView:UICollectionView, viewModel:SectionViewModel, indexPath: IndexPath) -> UICollectionViewCell {
        switch self.sectionType {
        case .Requirement:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RequirementCollectionViewCell.cellReuseIdentifier, for: indexPath) as! RequirementCollectionViewCell
            if let viewModel = viewModel as? RequirementSectionViewModel   {
                cell.viewModel = viewModel
            }
            return cell

        case .Banner:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellReuseIdentifier, for: indexPath) as! BannerCollectionViewCell
            if let viewModel = viewModel as? BannerSectionViewModel   {
                cell.viewModel = viewModel
            }
            return cell
        case .User:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.cellReuseIdentifier, for: indexPath) as! UserCollectionViewCell
            if let viewModel = viewModel as? UserSectionViewModel  {
                cell.viewModel = viewModel
            }
            return cell
            
        case .Dex:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DexCollectionViewCell.cellReuseIdentifier, for: indexPath) as! DexCollectionViewCell
            if let viewModel = viewModel as? DexSectionViewModel  {
                cell.viewModel = viewModel
            }
            return cell

        case .Unknown:
            break
        }
        return UICollectionViewCell()
    }
    
    func sizeForItemAt(collectionView:UICollectionView) -> CGSize {
        switch self.sectionType {
        case .Requirement:
            return CGSize(width: collectionView.bounds.width * 0.85, height: collectionView.bounds.height)

        case .Banner:
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)

        case .User:
            return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height)
            
        case .Dex:
            return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)

        case .Unknown:
            break
        }
        return CGSize.zero
    }
    
    func minimumLineSpacingForSectionAt()->CGFloat{
        return (self.sectionType == .Requirement || self.sectionType == .Dex ) ? 10.0 : 0.0
    }
}
