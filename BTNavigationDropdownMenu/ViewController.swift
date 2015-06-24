//
//  ViewController.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/8/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        let menuView = BTNavigationDropdownMenu(frame:  CGRectMake(0.0, 0.0, 300, 44), title: "Dep trai", items: ["Dep trai", "Ba Tho"])
        BTNavigationDropdownMenu.tableContainerView = self.view
        self.navigationItem.titleView = menuView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

