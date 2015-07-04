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
        let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false
        UINavigationBar.appearance().translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 240.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let menuView = BTNavigationDropdownMenu(frame:  CGRectMake(0.0, 0.0, 300, 44), title: items.first!, items: items)
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = UIColor(red: 240.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        menuView.cellSelectionColor = UIColor(red: 210.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Medium", size: 17)
        menuView.checkMarkImage = UIImage(named: "checkmark_icon")
        menuView.arrowPadding = 15
        menuView.arrowImage = UIImage(named: "arrow_down_icon.png")
        menuView.animationDuration = 0.3
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.maskBackgroundOpacity = 0.3
        menuView.bounceOffset = -5
        menuView.tableContainerView = self.view
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            println("Did select item at index: \(indexPath)")
            menuView.setMenuTitle("\(items[indexPath])")
        }
        
        self.navigationItem.titleView = menuView
    }
}

