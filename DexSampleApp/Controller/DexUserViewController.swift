//
//  DexUserViewController.swift
//  DexSampleApp
//
//  Created by admin on 15/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DexUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = DexUserVCViewModel()
    var str_viewControllerTitle : String?
    var str_dexID : String?
    static fileprivate let rowsToLoadFromBottom = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dex User"
        self.registerCells()
        if let dexID = self.str_dexID {
            self.fetchUsers(dexID: dexID)
        }
        // Do any additional setup after loading the view.
    }
    
    private func fetchUsers(dexID:String){
        self.viewModel.fetchUsers(dexID: dexID) {
            self.tableView.reloadData()
        }
    }
    
    func registerCells(){
        self.tableView.register(DexUserTableViewCell.cellNib(), forCellReuseIdentifier: DexUserTableViewCell.cellReuseIdentifier)
    }
}



extension DexUserViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DexUserTableViewCell.cellReuseIdentifier, for: indexPath) as! DexUserTableViewCell
        let userVM = self.viewModel.users[indexPath.row]
        cell.userView.lblFirstName.text = userVM.firstName
        cell.userView.lblLastName.text = userVM.lastName
        cell.userView.lblClapsCount.text =   (userVM.clapsCount != nil) ? "👏 " +  "\(userVM.clapsCount != nil)" : ""
        cell.userView.imageViewUser.sd_setImage(with: URL(string: userVM.imageUrl ?? ""), placeholderImage: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 2.5
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // See if we need to load more Users
        let thisItemIndex = indexPath.row
        if let nextDexId = self.viewModel.nextDexId, (thisItemIndex + type(of: self).rowsToLoadFromBottom) >= self.viewModel.users.count{
            self.fetchUsers(dexID: nextDexId)
        }
    }
}
