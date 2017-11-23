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
        
        let items = [BTNavigationDropdownMenu.MenuItem(title:"Favorites", image: UIImage(named:"favoritesMenuItemButton")!), BTNavigationDropdownMenu.MenuItem(title:"Ads", image: UIImage(named:"adsMenuItemButton")),BTNavigationDropdownMenu.MenuItem(title:"Chats", image: UIImage(named:"chatsMenuItemButton")!), BTNavigationDropdownMenu.MenuItem(title:"Settings", image: UIImage(named:"accountSettingsMenuItemButton")!), BTNavigationDropdownMenu.MenuItem(title:"Other stuff", image: UIImage(named:"menuButton")!)]
        
            
        self.selectedCellLabel.text = items.first?.title
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: items.first!.title, items: items as [BTNavigationDropdownMenu.MenuItem], backgroundViewMode: .blur)
        
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor.gray
        menuView.cellSeparatorColor = self.navigationController?.navigationBar.barTintColor
        
        menuView.cellTextLabelHorizontalMargin = 150.0
        
        menuView.cellTintColor = UIColor(red: 105/255, green: 220/255, blue: 95/255, alpha: 1.0)   // light green
        
        menuView.arrowTintColor = UIColor(red: 105/255, green: 220/255, blue: 95/255, alpha: 1.0) // light green
        menuView.arrowPadding =  20.0

        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor(red: 105/255, green: 220/255, blue: 95/255, alpha: 1.0) // light green
        if #available(iOS 9.0, *) {
            menuView.cellTextLabelFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
        } else {
           menuView.cellTextLabelFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        }
        menuView.cellTextLabelAlignment = .right// .center // .right // .left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.4
        
        menuView.blurStyle = .light
        menuView.delegate = self
        
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = items[indexPath].title
        }
        
        self.navigationItem.titleView = menuView
    }
}

extension ViewController: BTNavigationDropdownMenuDelegate {
    
    func menuDidShow() {
        print("menu did show")
    }
    
    func menuDidHide() {
        print("menu did hide")
    }
    
}
