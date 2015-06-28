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
    static var navigationTitleColor: UIColor!
    static var cellHeight: CGFloat!
    static var cellBackgroundColor: UIColor!
    static var cellTextLabelColor: UIColor!
    static var cellTextLabelFont: UIFont!
    static var cellSelectionColor: UIColor!
    static var arrowPadding: CGFloat!
    static var arrowImage: UIImage!
    static var tableContainerView: UIView!
    static var animationDuration: NSTimeInterval!
    static var maskBackgroundColor: UIColor!
    static var maskBackgroundOpacity: CGFloat!
    static var bounceOffset: CGFloat!
    
    // Private properties
    private var _menuButton: UIButton!
    private var _menuTitle: UILabel!
    private var _menuArrow: UIImageView!
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
        BTNavigationDropdownMenu.navigationTitleColor = UIColor.whiteColor()
        BTNavigationDropdownMenu.cellHeight = 50
        BTNavigationDropdownMenu.cellBackgroundColor = UIColor(red: 240.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        BTNavigationDropdownMenu.cellSelectionColor = UIColor(red: 210.0/255.0, green:32.0/255.0, blue:60.0/255.0, alpha: 1.0)
        BTNavigationDropdownMenu.cellTextLabelColor = UIColor.whiteColor()
        BTNavigationDropdownMenu.cellTextLabelFont = UIFont(name: "Avenir-Medium", size: 17)
        BTNavigationDropdownMenu.arrowPadding = 15
        BTNavigationDropdownMenu.arrowImage = UIImage(named: "arrow_down_icon.png")
        BTNavigationDropdownMenu.animationDuration = 0.3
        BTNavigationDropdownMenu.maskBackgroundColor = UIColor.blackColor()
        BTNavigationDropdownMenu.maskBackgroundOpacity = 0.3
        BTNavigationDropdownMenu.bounceOffset = -5
        
        // Init properties
        self._navigationBarHeight = 44
        self._mainScreenBounds = UIScreen.mainScreen().bounds
        self._isShown = false
        self._items = items
        
        // Init button as navigation title
        self._menuButton = UIButton(frame: frame)
        self._menuButton.addTarget(self, action: "menuButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(self._menuButton)
        
        self._menuTitle = UILabel(frame: frame)
        self._menuTitle.text = title
        self._menuTitle.textColor = BTNavigationDropdownMenu.navigationTitleColor
        self._menuTitle.textAlignment = NSTextAlignment.Center
        self._menuTitle.font = BTNavigationDropdownMenu.cellTextLabelFont
        self._menuButton.addSubview(self._menuTitle)
        
        self._menuArrow = UIImageView(image: BTNavigationDropdownMenu.arrowImage)
        self._menuButton.addSubview(self._menuArrow)
        
        // Init table view
        self._tableView = BTTableView(frame: _mainScreenBounds, items: _items)
        self._tableView.hideTableHandler = {() -> () in
            self.hideMenu()
            self._isShown = false
        }
    }
    
    override func layoutSubviews() {
        self._menuTitle.sizeToFit()
        self._menuTitle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self._menuArrow.frame = CGRectMake(0, 0, 12, 7)
        self._menuArrow.center = CGPointMake(CGRectGetMaxX(self._menuTitle.frame) + BTNavigationDropdownMenu.arrowPadding, self.frame.size.height/2)
    }
    
    func showMenu() {
        // Reload data to dismiss highlight color of selected cell
        self._tableView.reloadData()
        
        // Init background view (under table view)
        self._backgroundView = UIView(frame: _mainScreenBounds)
        self._backgroundView.backgroundColor = BTNavigationDropdownMenu.maskBackgroundColor
        
        // Add background view and table view to container view
        BTNavigationDropdownMenu.tableContainerView.addSubview(self._backgroundView)
        BTNavigationDropdownMenu.tableContainerView.addSubview(self._tableView)
        self._backgroundView.alpha = 0
        self.rotateArrow()
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
        self.rotateArrow()
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
    
    func rotateArrow() {
        UIView.animateWithDuration(BTNavigationDropdownMenu.animationDuration, animations: {[weak self] () -> () in
            if let selfie = self {
                selfie._menuArrow.transform = CGAffineTransformRotate(selfie._menuArrow.transform, 180 * CGFloat(M_PI/180))
            }

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
