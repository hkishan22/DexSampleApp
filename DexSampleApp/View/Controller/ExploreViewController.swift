//
//  ViewController.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//


import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel = ExploreViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "explore"
        self.registerCells()
        self.fetchSections()
    }
    
    private func fetchSections(){
        self.viewModel.fetchSections { [weak self](success,strError) in
            if success {
                self?.tableView.reloadData()
            }else if let _ = strError {
                //Show Error to user Here
            }
        }
    }
    
    func registerCells(){
        self.tableView.register(HorizontalTableViewCell.cellNib(), forCellReuseIdentifier: HorizontalTableViewCell.cellReuseIdentifier)
        self.tableView.register(SectionTitleTableViewCell.cellNib(), forCellReuseIdentifier: SectionTitleTableViewCell.cellReuseIdentifier)
    }
}


extension ExploreViewController:UITableViewDelegate,UITableViewDataSource,SectionNavigationHandler {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.layoutViewModels.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionViewModel = self.viewModel.layoutViewModels[indexPath.section]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionTitleTableViewCell.cellReuseIdentifier, for: indexPath) as! SectionTitleTableViewCell
            cell.lblTitle.text = sectionViewModel.title
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: HorizontalTableViewCell.cellReuseIdentifier, for: indexPath) as! HorizontalTableViewCell
        cell.sectionLayoutVM = sectionViewModel
        cell.sectionNavHandler = self
        cell.collectionCellDataSource = HorizontalCollectionCellDataSource.init(with: sectionViewModel.type)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            let sectionLayout = self.viewModel.layoutViewModels[indexPath.section]
            switch sectionLayout.type {
            case .Requirement:
                return UIScreen.main.bounds.width / 2.0
            case .Banner:
                return UIScreen.main.bounds.width / 2.5
            case .User:
                return UIScreen.main.bounds.width / 2.5
            case .Dex:
                return UIScreen.main.bounds.width / 2.5
            case .Unknown:
                return UITableView.automaticDimension
            }
        }
        return UITableView.automaticDimension
    }
    
    // Function to handle Section Action
    func handleAction(sectionType:SectionType,sectionViewModel:SectionViewModel) {
        if sectionType == .Banner {
            if let viewModel = sectionViewModel as? BannerSectionViewModel {
                let webViewViewModel = self.viewModel.webVCViewModel(viewModel: viewModel)
                NavigationHelper.redirectToWebPageWIthURL(webViewViewModel: webViewViewModel, presentFrom: self)
            }
        }else if sectionType == .Dex {
            if let viewModel = sectionViewModel as? DexSectionViewModel {
                let dexViewModel = self.viewModel.dexUserVCViewModelForSection(viewModel: viewModel)
                NavigationHelper.redirectToDexUser(dexViewModel: dexViewModel, presentFrom: self)
            }
        }
    }
}
