//
//  BTConfiguration.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/30/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

// MARK: BTNavigationDropdownMenu
public class BTNavigationDropdownMenu: UIView {
    
    // The height of the cell. Default is 50
    public var cellHeight: CGFloat! {
        didSet {
            self.configuration.cellHeight = cellHeight
        }
    }
    
    // The color of the cell background. Default is whiteColor()
    public var cellBackgroundColor: UIColor! {
        didSet {
            self.configuration.cellBackgroundColor = cellBackgroundColor
        }
    }
    
    // The color of the text inside cell. Default is darkGrayColor()
    public var cellTextLabelColor: UIColor! {
        didSet {
            self.configuration.cellTextLabelColor = cellTextLabelColor
        }
    }
    
    // The font of the text inside cell. Default is HelveticaNeue-Bold, size 19
    public var cellTextLabelFont: UIFont! {
        didSet {
            self.configuration.cellTextLabelFont = cellTextLabelFont
            self.menuTitle.font = self.configuration.cellTextLabelFont
        }
    }
    
    // The color of the cell when the cell is selected. Default is lightGrayColor()
    public var cellSelectionColor: UIColor! {
        didSet {
            self.configuration.cellSelectionColor = cellSelectionColor
        }
    }
    
    // The checkmark icon of the cell
    public var checkMarkImage: UIImage! {
        didSet {
            self.configuration.checkMarkImage = self.checkMarkImage
        }
    }
    
    // The animation duration of showing/hiding menu. Default is 0.3
    public var animationDuration: NSTimeInterval! {
        didSet {
            self.configuration.animationDuration = animationDuration
        }
    }
    
    // The value of bounce offset. Default is 10
    public var bounceOffset: CGFloat! {
        didSet {
            self.configuration.bounceOffset = bounceOffset
        }
    }

    // The arrow next to navigation title
    public var arrowImage: UIImage! {
        didSet {
            self.configuration.arrowImage = arrowImage
        }
    }
    
    // The padding between navigation title and arrow
    public var arrowPadding: CGFloat! {
        didSet {
            self.configuration.arrowPadding = arrowPadding
        }
    }
    
    // The color of the mask layer. Default is blackColor()
    public var maskBackgroundColor: UIColor! {
        didSet {
            self.configuration.maskBackgroundColor = maskBackgroundColor
        }
    }
    
    // The opacity of the mask layer. Default is 0.3
    public var maskBackgroundOpacity: CGFloat! {
        didSet {
            self.configuration.maskBackgroundOpacity = maskBackgroundOpacity
        }
    }
    
    public var didSelectItemAtIndexHandler: ((indexPath: Int) -> ())?

    // Private properties
    private var tableContainerView: UIView!
    private var configuration: BTConfiguration!
    private var mainScreenBounds: CGRect!
    private var menuButton: UIButton!
    private var menuTitle: UILabel!
    private var menuArrow: UIImageView!
    private var backgroundView: UIView!
    private var tableView: BTTableView!
    private var items: [AnyObject]!
    private var isShown: Bool!
    private var navigationBarHeight: CGFloat!
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(frame: CGRect, title: String, items: [AnyObject], containerView:UIView) {
        super.init(frame:frame)
        
        // Init properties
        self.configuration = BTConfiguration()
        self.tableContainerView = containerView
        self.navigationBarHeight = 44
        self.mainScreenBounds = UIScreen.mainScreen().bounds
        self.isShown = false
        self.items = items
        
        // Init button as navigation title
        self.menuButton = UIButton(frame: frame)
        self.menuButton.addTarget(self, action: "menuButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(self.menuButton)
        
        self.menuTitle = UILabel(frame: frame)
        self.menuTitle.text = title
        self.menuTitle.textColor = UINavigationBar.appearance().titleTextAttributes?[NSForegroundColorAttributeName] as? UIColor
        self.menuTitle.textAlignment = NSTextAlignment.Center
        self.menuTitle.font = self.configuration.cellTextLabelFont
        self.menuButton.addSubview(self.menuTitle)
        
        self.menuArrow = UIImageView(image: self.configuration.arrowImage)
        self.menuButton.addSubview(self.menuArrow)
        
        // Init table view
        self.tableView = BTTableView(frame: CGRectMake(mainScreenBounds.origin.x, mainScreenBounds.origin.y, mainScreenBounds.width, mainScreenBounds.height + 300 - 64), items: items, configuration: self.configuration)
        self.tableView.selectRowAtIndexPathHandler = { (indexPath: Int) -> () in
            self.didSelectItemAtIndexHandler!(indexPath: indexPath)
            self.setMenuTitle("\(items[indexPath])")
            self.hideMenu()
            self.isShown = false
            self.layoutSubviews()
        }
    }
    
    override public func layoutSubviews() {
        self.menuTitle.sizeToFit()
        self.menuTitle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self.menuArrow.frame = CGRectMake(0, 0, 12, 7)
        self.menuArrow.center = CGPointMake(CGRectGetMaxX(self.menuTitle.frame) + self.configuration.arrowPadding, self.frame.size.height/2)
    }
    
    func showMenu() {
        // Table view header
        var headerView = UIView(frame: CGRectMake(0, 0, self.frame.width, 300))
        headerView.backgroundColor = self.configuration.cellBackgroundColor
        self.tableView.tableHeaderView = headerView
        
        // Reload data to dismiss highlight color of selected cell
        self.tableView.reloadData()
        
        // Init background view (under table view)
        self.backgroundView = UIView(frame: mainScreenBounds)
        self.backgroundView.backgroundColor = self.configuration.maskBackgroundColor
        
        // Add background view & table view to container view
        self.tableContainerView.addSubview(self.backgroundView)
        self.tableContainerView.addSubview(self.tableView)
        
        // Rotate arrow
        self.rotateArrow()
        
        // Change background alpha
        self.backgroundView.alpha = 0
        
        // Animation
        self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.configuration.cellHeight - 300
        UIView.animateWithDuration(self.configuration.animationDuration, animations: {
            self.tableView.frame.origin.y = CGFloat(-300)
            self.tableView.contentOffset = CGPointMake(0, -self.configuration.bounceOffset);
            self.backgroundView.alpha = self.configuration.maskBackgroundOpacity
            }, completion: { _ in
                UIView.animateWithDuration(self.configuration.animationDuration/3, animations: {
                    self.tableView.contentOffset = CGPointMake(0, 0)
                })
        })
    }
    
    func hideMenu() {
        // Rotate arrow
        self.rotateArrow()
        
        // Change background alpha
        self.backgroundView.alpha = self.configuration.maskBackgroundOpacity
        
        // Animation
        UIView.animateWithDuration(self.configuration.animationDuration, delay: 0.15, options: UIViewAnimationOptions.TransitionNone, animations: {
            self.tableView.contentOffset = CGPointMake(0, self.configuration.bounceOffset);
            self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.configuration.cellHeight - 300
            self.backgroundView.alpha = 0
        }, completion: { _ in
            self.tableView.removeFromSuperview()
            self.backgroundView.removeFromSuperview()
        })
    }
    
    func rotateArrow() {
        UIView.animateWithDuration(self.configuration.animationDuration, animations: {[weak self] () -> () in
            if let selfie = self {
                selfie.menuArrow.transform = CGAffineTransformRotate(selfie.menuArrow.transform, 180 * CGFloat(M_PI/180))
            }
        })
    }
    
    func setMenuTitle(title: String) {
        self.menuTitle.text = title
    }
    
    func menuButtonTapped(sender: UIButton) {
        self.isShown = !self.isShown
        if self.isShown == true {
            self.showMenu()
        } else {
            self.hideMenu()
        }
    }
}

// MARK: BTConfiguration
class BTConfiguration {
    var cellHeight: CGFloat!
    var cellBackgroundColor: UIColor!
    var cellTextLabelColor: UIColor!
    var cellTextLabelFont: UIFont!
    var cellSelectionColor: UIColor!
    var checkMarkImage: UIImage!
    var arrowImage: UIImage!
    var arrowPadding: CGFloat!
    var animationDuration: NSTimeInterval!
    var maskBackgroundColor: UIColor!
    var maskBackgroundOpacity: CGFloat!
    var bounceOffset: CGFloat!
    
    init() {
        self.defaultValue()
    }
    
    func defaultValue() {
        // Path for image
        let bundle = NSBundle(forClass: BTConfiguration.self)
        let url = bundle.URLForResource("BTNavigationDropdownMenu", withExtension: "bundle")
        let imageBundle = NSBundle(URL: url!)
        let checkMarkImagePath = imageBundle?.pathForResource("checkmark_icon", ofType: "png")
        let arrowImagePath = imageBundle?.pathForResource("arrow_down_icon", ofType: "png")

        // Default values
        self.cellHeight = 50
        self.cellBackgroundColor = UIColor.whiteColor()
        self.cellTextLabelColor = UIColor.darkGrayColor()
        self.cellTextLabelFont = UIFont(name: "HelveticaNeue-Bold", size: 17)
        self.cellSelectionColor = UIColor.lightGrayColor()
        self.checkMarkImage = UIImage(contentsOfFile: checkMarkImagePath!)
        self.animationDuration = 0.3
        self.bounceOffset = 10
        self.arrowImage = UIImage(contentsOfFile: arrowImagePath!)
        self.arrowPadding = 15
        self.maskBackgroundColor = UIColor.blackColor()
        self.maskBackgroundOpacity = 0.3
    }
}

// MARK: Table View
class BTTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // Public properties
    var configuration: BTConfiguration!
    var selectRowAtIndexPathHandler: ((indexPath: Int) -> ())?
    
    // Private properties
    private var items: [AnyObject]!
    private var selectedIndexPath: Int!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, items: [AnyObject], configuration: BTConfiguration) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        
        self.items = items
        self.selectedIndexPath = 0
        self.configuration = configuration
        
        // Setup table view
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.tableFooterView = UIView(frame: CGRectZero)
    }
    
    // Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.configuration.cellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = BTTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell", configuration: self.configuration)
        cell.textLabel?.text = self.items[indexPath.row] as? String
        if indexPath.row == selectedIndexPath {
            cell.checkmarkIcon.hidden = false
        } else {
            cell.checkmarkIcon.hidden = true
        }
        return cell
    }
    
    // Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndexPath = indexPath.row
        self.selectRowAtIndexPathHandler!(indexPath: indexPath.row)
        self.reloadData()
        var cell = tableView.cellForRowAtIndexPath(indexPath) as? BTTableViewCell
        cell?.contentView.backgroundColor = self.configuration.cellSelectionColor
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as? BTTableViewCell
        cell?.checkmarkIcon.hidden = true
        cell?.contentView.backgroundColor = self.configuration.cellBackgroundColor
    }
}

// MARK: Table view cell
class BTTableViewCell: UITableViewCell {
    
    var checkmarkIcon: UIImageView!
    var cellContentFrame: CGRect!
    var configuration: BTConfiguration!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, configuration: BTConfiguration) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configuration = configuration
        
        // Setup cell
        cellContentFrame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, self.configuration.cellHeight)
        self.contentView.backgroundColor = self.configuration.cellBackgroundColor
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.textLabel!.textAlignment = NSTextAlignment.Left
        self.textLabel!.textColor = self.configuration.cellTextLabelColor
        self.textLabel!.font = self.configuration.cellTextLabelFont
        self.textLabel!.frame = CGRectMake(20, 0, cellContentFrame.width, cellContentFrame.height)
        
        
        // Checkmark icon
        self.checkmarkIcon = UIImageView(frame: CGRectMake(cellContentFrame.width - 50, (cellContentFrame.height - 30)/2, 30, 30))
        self.checkmarkIcon.hidden = true
        self.checkmarkIcon.image = self.configuration.checkMarkImage
        self.checkmarkIcon.contentMode = UIViewContentMode.ScaleAspectFill
        self.contentView.addSubview(self.checkmarkIcon)
        
        // Separator for cell
        let separator = BTTableCellContentView(frame: cellContentFrame)
        separator.backgroundColor = UIColor.clearColor()
        self.contentView.addSubview(separator)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.bounds = cellContentFrame
        self.contentView.frame = self.bounds
    }
}

// Content view of table view cell
class BTTableCellContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 0.5)
        CGContextSetLineWidth(context, 1)
        CGContextMoveToPoint(context, 0, self.bounds.size.height)
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height)
        CGContextStrokePath(context)
    }
}

