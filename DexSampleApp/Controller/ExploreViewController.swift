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
    
    var viewModel = ExploreViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "explore"
        self.registerCells()
        self.viewModel.fetchSections {
            self.tableView.reloadData()
        }
    }
    
    
    func registerCells(){
        self.tableView.register(DexTableViewCell.cellNib(), forCellReuseIdentifier: DexTableViewCell.cellReuseIdentifier)
        self.tableView.register(UserTableViewCell.cellNib(), forCellReuseIdentifier: UserTableViewCell.cellReuseIdentifier)
        self.tableView.register(RequirementTableViewCell.cellNib(), forCellReuseIdentifier: RequirementTableViewCell.cellReuseIdentifier)
        self.tableView.register(BannerTableViewCell.cellNib(), forCellReuseIdentifier: BannerTableViewCell.cellReuseIdentifier)
        self.tableView.register(SectionTitleTableViewCell.cellNib(), forCellReuseIdentifier: SectionTitleTableViewCell.cellReuseIdentifier)
    }
}


extension ExploreViewController:UITableViewDelegate,UITableViewDataSource,SectionNavigationHandler {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionLayouts.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionLayout = self.viewModel.sectionLayouts[indexPath.section]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionTitleTableViewCell.cellReuseIdentifier, for: indexPath) as! SectionTitleTableViewCell
            cell.lblTitle.text = sectionLayout.title
            return cell
        }else{
            switch sectionLayout.type {
            case .Banner:
                let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.cellReuseIdentifier, for: indexPath) as! BannerTableViewCell
                cell.sectionNavHandler = self
                cell.sectionLayout = sectionLayout
                return cell

            case .Dex:
                let cell = tableView.dequeueReusableCell(withIdentifier: DexTableViewCell.cellReuseIdentifier, for: indexPath) as! DexTableViewCell
                cell.sectionNavHandler = self
                cell.sectionLayout = sectionLayout
                return cell

            case .Requirement:
                let cell = tableView.dequeueReusableCell(withIdentifier: RequirementTableViewCell.cellReuseIdentifier, for: indexPath) as! RequirementTableViewCell
                cell.sectionLayout = sectionLayout
                return cell

            case .User:
                let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellReuseIdentifier, for: indexPath) as! UserTableViewCell
                cell.sectionLayout = sectionLayout
                return cell

            case .Unknown:
                break
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            let sectionLayout = self.viewModel.sectionLayouts[indexPath.section]
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
    func handleAction(sectionType:SectionType,entity: Entities, title: String) {
        if sectionType == .Banner {
            if let entity = entity as? BannerEntities, let urlString = entity.actionUrl {
                NavigationHelper.redirectToWebPageWIthURL(urlString: urlString, presentFrom: self,title:title)
            }
        }else if sectionType == .Dex {
            if let entity = entity as? DexEntites, let dexID = entity._id {
                NavigationHelper.redirectToDexUser(dexId: dexID, presentFrom: self, title: title)
            }
        }
    }
}
