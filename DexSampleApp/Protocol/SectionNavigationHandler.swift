//
//  SectionNavigationHandler.swift
//  DexSampleApp
//
//  Created by admin on 16/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

// Protocol to handle Single Entity selection.
protocol SectionNavigationHandler{
    func handleAction(sectionType:SectionType,sectionViewModel:SectionViewModel)
}
