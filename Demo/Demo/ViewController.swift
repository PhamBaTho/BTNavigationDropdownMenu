//
//  ViewController.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/8/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedCellLabel: UILabel!
    var menuView: BTNavigationDropdownMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
        
        let items = [MenuItem(title:"Favorites", image: UIImage(named:"favoritesMenuItemButton")!), MenuItem(title:"Ads", image: UIImage(named:"adsMenuItemButton")!), MenuItem(title:"Chats", image: UIImage(named:"chatsMenuItemButton")!), MenuItem(title:"Settings", image: UIImage(named:"accountSettingsMenuItemButton")!), MenuItem(title:"Other stuff", image: UIImage(named:"menuButton")!)]
        
        self.selectedCellLabel.text = items.first?.title
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "Dropdown Menu", items: items as [MenuItem])
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor.gray
        menuView.cellSeparatorColor = self.navigationController?.navigationBar.barTintColor
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.green
        if #available(iOS 9.0, *) {
            menuView.cellTextLabelFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
        } else {
           menuView.cellTextLabelFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        }
        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.4
        menuView.maskBackgroundColor = UIColor.black
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = items[indexPath].title
        }
        
        self.navigationItem.titleView = menuView
    }
}

