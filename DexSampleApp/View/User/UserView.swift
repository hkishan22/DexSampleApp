//
//  UserView.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class UserView: UIView     {

    @IBOutlet weak var contentView:     UIView!
    @IBOutlet weak var lblFirstName:    UILabel!
    @IBOutlet weak var lblLastName:     UILabel!
    @IBOutlet weak var lblClapsCount:   UILabel!
    @IBOutlet weak var imageViewUser:   RoundImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("UserView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
