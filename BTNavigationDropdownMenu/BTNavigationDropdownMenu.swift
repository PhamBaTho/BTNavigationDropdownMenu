//
//  BTNavigationDropdownView.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/8/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class BTNavigationDropdownMenu: UIView {
    
    // Public properties
    static var cellHeight: CGFloat!
    static var cellBackgroundColor: UIColor!
    static var cellTextLabelColor: UIColor!
    static var cellTextLabelFont: UIFont!
    static var cellSelectionColor: UIColor!
    static var tableContainerView: UIView!
    static var animationDuration: NSTimeInterval!
    static var maskBackgroundColor: UIColor!
    static var maskBackgroundOpacity: CGFloat!
    static var bounceOffset: CGFloat!
    
    // Private properties
    private var _menuButton: UIButton!
    private var _items: [AnyObject]!
    private var _backgroundView: UIView!
    private var _tableView: BTTableView!
    private var _isShown: Bool!
    private var _navigationBarHeight: CGFloat!
    private var _mainScreenBounds: CGRect!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, title: String, items: [AnyObject]) {
        super.init(frame:frame)
        
        // Init public properties
        BTNavigationDropdownMenu.cellHeight = 44
        BTNavigationDropdownMenu.cellBackgroundColor = UIColor(red: 222.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        BTNavigationDropdownMenu.cellSelectionColor = UIColor(red: 200.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        BTNavigationDropdownMenu.cellTextLabelColor = UIColor.whiteColor()
        BTNavigationDropdownMenu.cellTextLabelFont = UIFont(name: "Avenir-Medium", size: 17)
        BTNavigationDropdownMenu.animationDuration = 0.4
        BTNavigationDropdownMenu.maskBackgroundColor = UIColor.blackColor()
        BTNavigationDropdownMenu.maskBackgroundOpacity = 0.3
        BTNavigationDropdownMenu.bounceOffset = -5
        
        self._navigationBarHeight = 44
        self._mainScreenBounds = UIScreen.mainScreen().bounds
        self._isShown = false
        self._items = items
        
        // Init button as navigation title
        self._menuButton = UIButton(frame: frame)
        self._menuButton.setTitle(title, forState: UIControlState.Normal)
        self._menuButton.titleLabel?.font = BTNavigationDropdownMenu.cellTextLabelFont
        self._menuButton.addTarget(self, action: "menuButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(self._menuButton)
        
        self._tableView = BTTableView(frame: _mainScreenBounds, items: _items)
    }
    
    func showMenu() {
        // Init table view
        self._tableView.hideTableHandler = {() -> () in
            self.hideMenu()
            self._isShown = false
        }
        
        // Reload data to dismiss highlight color of selected cell
        self._tableView.reloadData()
        
        // Init background view (under table view)
        self._backgroundView = UIView(frame: _mainScreenBounds)
        self._backgroundView.backgroundColor = BTNavigationDropdownMenu.maskBackgroundColor
        
        // Add background view and table view to container view
        BTNavigationDropdownMenu.tableContainerView.addSubview(self._backgroundView)
        BTNavigationDropdownMenu.tableContainerView.addSubview(self._tableView)
        self._backgroundView.alpha = 0
        self._tableView.frame.origin.y = -CGFloat(self._items.count) * BTNavigationDropdownMenu.cellHeight - 300
        UIView.animateWithDuration(BTNavigationDropdownMenu.animationDuration, animations: {
            self._tableView.frame.origin.y = CGFloat(-300)
            self._tableView.contentOffset = CGPointMake(0, BTNavigationDropdownMenu.bounceOffset);
            self._backgroundView.alpha = BTNavigationDropdownMenu.maskBackgroundOpacity
            }, completion: { _ in
                UIView.animateWithDuration(BTNavigationDropdownMenu.animationDuration/3, animations: {
                    self._tableView.contentOffset = CGPointMake(0, 0);
                })
        })
    }
    
    func hideMenu() {
        self._backgroundView.alpha = BTNavigationDropdownMenu.maskBackgroundOpacity
        UIView.animateWithDuration(BTNavigationDropdownMenu.animationDuration, delay: 0.15, options: UIViewAnimationOptions.TransitionNone, animations: {
            self._tableView.contentOffset = CGPointMake(0, BTNavigationDropdownMenu.bounceOffset);
            self._tableView.frame.origin.y = -CGFloat(self._items.count) * BTNavigationDropdownMenu.cellHeight - 300
            self._backgroundView.alpha = 0
        }, completion: { _ in
            self._tableView.removeFromSuperview()
            self._backgroundView.removeFromSuperview()
        })
    }
    
    func menuButtonTapped(sender: UIButton) {
        self._isShown = !self._isShown
        if self._isShown == true {
            self.showMenu()
        } else {
            self.hideMenu()
        }
    }
}
