//
//  CollectionCellDataSource.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
// Protocol to populate Horizontal Table view Cell
protocol CollectionCellDataSource  {
    func registerCell(collectionView:UICollectionView)
    func setFlowLayout(collectionView:UICollectionView)
    func cell(collectionView:UICollectionView, viewModel:SectionViewModel, indexPath: IndexPath)->UICollectionViewCell
    func sizeForItemAt(collectionView:UICollectionView)->CGSize
    func minimumLineSpacingForSectionAt()->CGFloat
}
