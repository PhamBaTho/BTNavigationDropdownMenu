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
open class BTNavigationDropdownMenu: UIView {
    
    public struct MenuItem {
        var title:String
        var image:UIImage?
        
      public  init(title: String, image:UIImage?) {
            self.title = title
            self.image = image
        }
        
    }
    
    public enum BackgroundViewMode {
        case dim, blur
    }
    
    // The color of menu title. Default is darkGrayColor()
    open var menuTitleColor: UIColor! {
        get {
            return self.configuration.menuTitleColor
        }
        set(value) {
            self.configuration.menuTitleColor = value
        }
    }

    // The height of the cell. Default is 50
    open var cellHeight: NSNumber! {
        get {
         //   return CGFloat(self.configuration.cellHeight)
            return  NSNumber(value:Float(self.configuration.cellHeight))
        }
        set(value) {
            self.configuration.cellHeight = CGFloat(value)
        }
    }

    
    // the color of the images and the checkmark. Default value is nil. If this value is nil, png images  and checkmark have their original colours
    open var cellTintColor: UIColor? {
        get {
            return self.configuration.cellTintColor
        }
        set(color) {
            self.configuration.cellTintColor = color
        }
    }
    
    
    // The color of the cell background. Default is whiteColor()
    open var cellBackgroundColor: UIColor! {
        get {
            return self.configuration.cellBackgroundColor
        }
        set(color) {
            self.configuration.cellBackgroundColor = color
        }
    }
    
    // The tint color of the arrow. Default is whiteColor()
    open var arrowTintColor: UIColor! {
        get {
            return self.menuArrow.tintColor
        }
        set(color) {
            self.menuArrow.tintColor = color
        }
    }
    
    open var cellSeparatorColor: UIColor! {
        get {
            return self.configuration.cellSeparatorColor
        }
        set(value) {
            self.configuration.cellSeparatorColor = value
        }
    }
    
    // The color of the text inside cell. Default is darkGrayColor()
    open var cellTextLabelColor: UIColor! {
        get {
            return self.configuration.cellTextLabelColor
        }
        set(value) {
            self.configuration.cellTextLabelColor = value
        }
    }
    
    // The color of the text inside a selected cell. Default is darkGrayColor()
    open var selectedCellTextLabelColor: UIColor! {
        get {
            return self.configuration.selectedCellTextLabelColor
        }
        set(value) {
            self.configuration.selectedCellTextLabelColor = value
        }
    }
    
    // The font of the text inside cell. Default is HelveticaNeue-Bold, size 17
    open var cellTextLabelFont: UIFont! {
        get {
            return self.configuration.cellTextLabelFont
        }
        set(value) {
            self.configuration.cellTextLabelFont = value
        }
    }
    
    // distance of text label from cell edge.
    open var cellTextLabelHorizontalMargin: CGFloat! {
        get {
            return self.configuration.cellTextLabelHorizontalMargin
        }
        set(value) {
            self.configuration.cellTextLabelHorizontalMargin = value
        }
        
    }
    
    
    // height and width of the image (square shaped)
    open var cellImageSize: CGFloat! {
        get {
            return self.configuration.cellImageSize
        }
        
        set(value) {
            self.configuration.cellImageSize = value
        }
        
    }
    
    
    // margin between image and text label
    open var cellLabelImageDistance: CGFloat! {
        get {
            return self.configuration.cellLabelImageDistance
        }
        
        set(value) {
            self.configuration.cellLabelImageDistance = value
        }
        
    }
    

    // The font of the navigation bar title. Default is HelveticaNeue-Bold, size 17
    open var navigationBarTitleFont: UIFont! {
        get {
            return self.configuration.navigationBarTitleFont
        }
        set(value) {
            self.configuration.navigationBarTitleFont = value
            self.menuTitle.font = self.configuration.navigationBarTitleFont
        }
    }
    
    // The alignment of the text inside cell. Default is .Left
    open var cellTextLabelAlignment: NSTextAlignment! {
        get {
            return self.configuration.cellTextLabelAlignment
        }
        set(value) {
            self.configuration.cellTextLabelAlignment = value
        }
    }
    
    // The color of the cell when the cell is selected. Default is lightGrayColor()
    open var cellSelectionColor: UIColor! {
        get {
            return self.configuration.cellSelectionColor
        }
        set(value) {
            self.configuration.cellSelectionColor = value
        }
    }
    
    // The checkmark icon of the cell
    open var checkMarkImage: UIImage! {
        get {
            return self.configuration.checkMarkImage
        }
        set(value) {
            self.configuration.checkMarkImage = value
        }
    }
    
    // The boolean value that decides if selected color of cell is visible when the menu is shown. Default is false
    open var shouldKeepSelectedCellColor: Bool! {
        get {
            return self.configuration.shouldKeepSelectedCellColor
        }
        set(value) {
            self.configuration.shouldKeepSelectedCellColor = value
        }
    }
    
    // The animation duration of showing/hiding menu. Default is 0.3
    open var animationDuration: TimeInterval! {
        get {
            return self.configuration.animationDuration
        }
        set(value) {
            self.configuration.animationDuration = value
        }
    }

    // The arrow next to navigation title
    open var arrowImage: UIImage! {
        get {
            return self.configuration.arrowImage
        }
        set(value) {
            self.configuration.arrowImage = value.withRenderingMode(.alwaysTemplate)
            self.menuArrow.image = self.configuration.arrowImage
        }
    }
    
    // The padding between navigation title and arrow
    open var arrowPadding: CGFloat! {
        get {
            return self.configuration.arrowPadding
        }
        set(value) {
            self.configuration.arrowPadding = value
        }
    }
    
    // The color of the mask layer. Default is blackColor()
    open var dimBackgroundColor: UIColor! {
        get {
            return self.configuration.dimBackgroundColor
        }
        set(value) {
            self.configuration.dimBackgroundColor = value
        }
    }
    
    // The opacity of the mask layer. Default is 0.3
    open var dimBackgroundOpacity: CGFloat! {
        get {
            return self.configuration.dimBackgroundOpacity
        }
        set(value) {
            self.configuration.dimBackgroundOpacity = value
        }
    }
    

    
    
    // The boolean value that decides if you want to change the title text when a cell is selected. Default is true
    open var shouldChangeTitleText: Bool! {
        get {
            return self.configuration.shouldChangeTitleText
        }
        set(value) {
            self.configuration.shouldChangeTitleText = value
        }
    }
    

    
    open var didSelectItemAtIndexHandler: ((_ indexPath: Int) -> ())!
    open var isShown: Bool!

    fileprivate weak var navigationController: UINavigationController?
    fileprivate var configuration = BTConfiguration()
    fileprivate var topSeparator: UIView!
    fileprivate var menuButton: UIButton!
    fileprivate var menuTitle: UILabel!
    fileprivate var menuArrow: UIImageView!
    fileprivate var backgroundView: UIView!
    fileprivate var tableView: BTTableView!
    fileprivate var items: [MenuItem]!
    fileprivate var menuWrapper: UIView!
    fileprivate var backgroundViewMode: BackgroundViewMode!
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(navigationController: UINavigationController? = nil, containerView: UIView = UIApplication.shared.keyWindow!, title: String, items: [MenuItem], backgroundViewMode: BackgroundViewMode?) {
        // Key window
        guard let window = UIApplication.shared.keyWindow else {
            super.init(frame: CGRect.zero)
            return
        }
        
        // Navigation controller
        if let navigationController = navigationController {
            self.navigationController = navigationController
        } else {
            self.navigationController = window.rootViewController?.topMostViewController?.navigationController
        }
        
        
        // Get titleSize
          // get longest title
        
        var titleLength = CGFloat(0)
        var longestTitle = title
        
        for item in items {
            
            let titleWidth = (item.title as NSString).size(attributes: [NSFontAttributeName:self.configuration.navigationBarTitleFont]).width
            
            if titleWidth > titleLength {
                titleLength = titleWidth
                longestTitle = item.title
                print("longest title is  \(item.title)")
            }
            
        }
        
       let titleSize = (longestTitle as NSString).size(attributes: [NSFontAttributeName:self.configuration.navigationBarTitleFont])
        
        // Set frame
        let frame = CGRect(x: 0, y: 0, width: titleSize.width + (self.configuration.arrowPadding + self.configuration.arrowImage.size.width)*2, height: self.navigationController!.navigationBar.frame.height)
        
        super.init(frame:frame)
        
        self.isShown = false
        self.items = items
        
        // Init button as navigation title
        self.menuButton = UIButton(frame: frame)
        self.menuButton.addTarget(self, action: #selector(BTNavigationDropdownMenu.menuButtonTapped(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(self.menuButton)

        self.menuTitle = UILabel(frame: frame)
        self.menuTitle.text = title
        self.menuTitle.textColor = self.menuTitleColor
        self.menuTitle.font = self.configuration.navigationBarTitleFont
        self.menuTitle.textAlignment = self.configuration.cellTextLabelAlignment
        self.menuButton.addSubview(self.menuTitle)
        
        self.menuArrow = UIImageView(image: self.configuration.arrowImage.withRenderingMode(.alwaysTemplate))
        self.menuButton.addSubview(self.menuArrow)
        
        let menuWrapperBounds = window.bounds
        
        // Set up DropdownMenu
        self.menuWrapper = UIView(frame: CGRect(x: menuWrapperBounds.origin.x, y: 0, width: menuWrapperBounds.width, height: menuWrapperBounds.height))
        self.menuWrapper.clipsToBounds = true
        self.menuWrapper.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        
        
        // Init background view (under table view)
        
        if backgroundViewMode == .dim {
             self.backgroundView = self.getdimView(frame: menuWrapperBounds)
            self.backgroundView.backgroundColor = self.dimBackgroundColor
            self.backgroundViewMode = .dim
        }
        
        else if backgroundViewMode == .blur {
            self.backgroundView = self.getBlurView(frame: menuWrapperBounds)
            self.backgroundViewMode = .blur
        }
       
      //  self.backgroundView.backgroundColor = self.configuration.dimBackgroundColor
        self.backgroundView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]

 
        let backgroundTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(BTNavigationDropdownMenu.hideMenu));
        self.backgroundView.addGestureRecognizer(backgroundTapRecognizer)


        // Init properties
        self.setupDefaultConfiguration()
        
        // Init table view
        let navBarHeight = self.navigationController?.navigationBar.bounds.size.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height 
        self.tableView = BTTableView(frame: CGRect(x: menuWrapperBounds.origin.x, y: menuWrapperBounds.origin.y + 0.5, width: menuWrapperBounds.width, height: menuWrapperBounds.height + 300 - navBarHeight - statusBarHeight), items: items, title: title, configuration: self.configuration)
        
        self.tableView.selectRowAtIndexPathHandler = { [weak self] (indexPath: Int) -> () in
            guard let selfie = self else {
                return
            }
            selfie.didSelectItemAtIndexHandler!(indexPath)
            if selfie.shouldChangeTitleText! {
                selfie.setMenuTitle("\(selfie.tableView.items[indexPath].title)")
            }
            self?.hideMenu()
            self?.layoutSubviews()
        }
        
        
        // Add background view & table view to container view
        self.menuWrapper.addSubview(self.backgroundView)
        self.menuWrapper.addSubview(self.tableView)

        
        // Add Line on top
        self.topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: menuWrapperBounds.size.width, height: 0.5))
        self.topSeparator.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.menuWrapper.addSubview(self.topSeparator)
        
        // Add Menu View to container view
        containerView.addSubview(self.menuWrapper)
        
        // By default, hide menu view
        self.menuWrapper.isHidden = true        
    }
    
    fileprivate func getdimView(frame:CGRect)->UIView {
        let dimView = UIView(frame:frame)
        dimView.backgroundColor = self.configuration.dimBackgroundColor
        return dimView
    }
    
    fileprivate func getBlurView(frame:CGRect)->UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: self.configuration.blurStyle)
        let blurredView = UIVisualEffectView(effect: blurEffect)
        
        blurredView.frame = frame
        blurredView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return blurredView
        
    }
    
    override open func layoutSubviews() {
        self.menuTitle.sizeToFit()
        self.menuTitle.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        self.menuTitle.textColor = self.configuration.menuTitleColor
        self.menuArrow.sizeToFit()
        self.menuArrow.center = CGPoint(x: self.menuTitle.frame.maxX + self.configuration.arrowPadding, y: self.frame.size.height/2)
        self.menuWrapper.frame.origin.y = self.navigationController!.navigationBar.frame.maxY
        
        self.tableView.reloadData()
    }
    
    open func show() {
        if self.isShown == false {
            self.showMenu()
        }
    }
    
    open func hide() {
        if self.isShown == true {
            self.hideMenu()
        }
    }

    open func toggle() {
        if(self.isShown == true) {
            self.hideMenu();
        } else {
            self.showMenu();
        }
    }
    
    open func updateItems(_ items: [MenuItem]) {
        if !items.isEmpty {
            self.tableView.items = items
            self.tableView.reloadData()
        }
    }
    
    func setupDefaultConfiguration() {
        self.menuTitleColor = self.navigationController?.navigationBar.titleTextAttributes?[NSForegroundColorAttributeName] as? UIColor
        self.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        self.cellSeparatorColor = self.navigationController?.navigationBar.titleTextAttributes?[NSForegroundColorAttributeName] as? UIColor
        self.cellTextLabelColor = self.navigationController?.navigationBar.titleTextAttributes?[NSForegroundColorAttributeName] as? UIColor
        
        self.arrowTintColor = self.configuration.arrowTintColor
    }
    
    func showMenu() {
        self.menuWrapper.frame.origin.y = self.navigationController!.navigationBar.frame.maxY
        
        self.isShown = true
        
        // Table view header
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 300))
        headerView.backgroundColor = self.configuration.cellBackgroundColor
        self.tableView.tableHeaderView = headerView
        
        self.topSeparator.backgroundColor = self.configuration.cellSeparatorColor
        

        // Rotate arrow
        self.rotateArrow()
        
        // Visible menu view
        self.menuWrapper.isHidden = false
        
        // Change background alpha
        self.backgroundView.alpha = 0
        
        // Animation
        self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.configuration.cellHeight - 300
        
        // Reload data to dismiss highlight color of selected cell
        self.tableView.reloadData()
        
        self.menuWrapper.superview?.bringSubview(toFront: self.menuWrapper)
        
        UIView.animate(
            withDuration: self.configuration.animationDuration * 1.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                self.tableView.frame.origin.y = CGFloat(-300)
                if self.backgroundViewMode == .dim {
                    self.backgroundView.alpha = self.configuration.dimBackgroundOpacity
                } else {
                    self.backgroundView.alpha = 1.0
                }
            }, completion: nil
        )
    }
    
    func hideMenu() {
        // Rotate arrow
        self.rotateArrow()
        
        self.isShown = false
        
        // Change background alpha
        if self.backgroundViewMode == .dim {
            self.backgroundView.alpha = self.configuration.dimBackgroundOpacity
        } else {
            self.backgroundView.alpha = 1.0
        }
        
        UIView.animate(
            withDuration: self.configuration.animationDuration * 1.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                self.tableView.frame.origin.y = CGFloat(-200)
            }, completion: nil
        )
        
        // Animation
        UIView.animate(
            withDuration: self.configuration.animationDuration,
            delay: 0,
            options: UIViewAnimationOptions(),
            animations: {
                self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.configuration.cellHeight - 300
                self.backgroundView.alpha = 0
            }, completion: { _ in
                if self.isShown == false && self.tableView.frame.origin.y == -CGFloat(self.items.count) * self.configuration.cellHeight - 300 {
                    self.menuWrapper.isHidden = true
                }
        })
    }
    
    func rotateArrow() {
        UIView.animate(withDuration: self.configuration.animationDuration, animations: {[weak self] () -> () in
            if let selfie = self {
                selfie.menuArrow.transform = selfie.menuArrow.transform.rotated(by: 180 * CGFloat(M_PI/180))
            }
            })
    }
    
    func setMenuTitle(_ title: String) {
        self.menuTitle.text = title
    }
    
    func menuButtonTapped(_ sender: UIButton) {
        self.isShown == true ? hideMenu() : showMenu()
    }
    
    open func setSelectedItem(at index: Int){
     
        let indexPath = IndexPath(row: index, section: 0)
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        self.tableView.tableView(self.tableView, didSelectRowAt: indexPath)
    }
    
}

// MARK: BTConfiguration
class BTConfiguration {
    var menuTitleColor: UIColor?
    var cellHeight: CGFloat!
    var cellBackgroundColor: UIColor?
    var cellSeparatorColor: UIColor?
    var cellTextLabelColor: UIColor?
    var selectedCellTextLabelColor: UIColor?
    var cellTextLabelFont: UIFont!
    var navigationBarTitleFont: UIFont!
    var cellTextLabelAlignment: NSTextAlignment!
    var cellTextLabelHorizontalMargin: CGFloat!
    var cellImageSize:CGFloat!
    var cellLabelImageDistance: CGFloat!
    var cellSelectionColor: UIColor?
    var cellTintColor: UIColor?
    var checkMarkImage: UIImage!
    var shouldKeepSelectedCellColor: Bool!
    var arrowTintColor: UIColor?
    var arrowImage: UIImage!
    var arrowPadding: CGFloat!
    var animationDuration: TimeInterval!
    var dimBackgroundColor: UIColor!
    var dimBackgroundOpacity: CGFloat!
    var blurStyle:UIBlurEffectStyle!

    var shouldChangeTitleText: Bool!
    
    init() {
        self.defaultValue()
    }
    
    func defaultValue() {
        // Path for image
        let bundle = Bundle(for: BTConfiguration.self)
        let url = bundle.url(forResource: "BTNavigationDropdownMenu", withExtension: "bundle")
        let imageBundle = Bundle(url: url!)
        let checkMarkImagePath = imageBundle?.path(forResource: "checkmark_icon", ofType: "png")
        let arrowImagePath = imageBundle?.path(forResource: "arrow_down_icon", ofType: "png")

        // Default values
        self.menuTitleColor = UIColor.darkGray
        self.cellHeight = 50
        self.cellBackgroundColor = UIColor.white
        self.arrowTintColor = UIColor.white
        self.cellSeparatorColor = UIColor.darkGray
        self.cellTextLabelColor = UIColor.darkGray
        self.selectedCellTextLabelColor = UIColor.darkGray
        self.cellTextLabelFont = UIFont(name: "HelveticaNeue-Bold", size: 17)
        self.navigationBarTitleFont = UIFont(name: "HelveticaNeue-Bold", size: 17)
        self.cellTextLabelAlignment = NSTextAlignment.left
        self.cellTextLabelHorizontalMargin = 50
        self.cellImageSize = 35
        self.cellLabelImageDistance = 5.0
        self.cellSelectionColor = UIColor.lightGray
        self.checkMarkImage = UIImage(contentsOfFile: checkMarkImagePath!)
        self.shouldKeepSelectedCellColor = false
        self.animationDuration = 0.5
        self.arrowImage = UIImage(contentsOfFile: arrowImagePath!)
        self.arrowPadding = 15
        self.dimBackgroundColor = UIColor.black
        self.dimBackgroundOpacity = 0.3
        self.blurStyle = .dark
        self.shouldChangeTitleText = true
    }
}

// MARK: Table View
class BTTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // Public properties
    var configuration: BTConfiguration!
    var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    // Private properties
    fileprivate var items:[BTNavigationDropdownMenu.MenuItem]!
    fileprivate var selectedIndexPath: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, items: [BTNavigationDropdownMenu.MenuItem], title: String, configuration: BTConfiguration) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        
        self.items = items

        print("BT table view init, title is \(title)")
        var index = 0
        for item in self.items {
            if item.title == title {
                self.selectedIndexPath = index
                print("selected index path title is \(item.title)")
                break
            }
            
            index += 1
        }
        
        
        self.configuration = configuration
        
        // Setup table view
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clear
        self.separatorStyle = UITableViewCellSeparatorStyle.none
        //        self.separatorEffect = UIBlurEffect(style: .Light)
        self.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let hitView = super.hitTest(point, with: event), hitView.isKind(of: BTTableCellContentView.self) {
            return hitView
        }
        return nil;
    }
    
    // Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configuration.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BTTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell", configuration: self.configuration)
        cell.textLabel?.text = self.items[indexPath.row].title
 
       // cell.isSelected = indexPath.row == self.selectedIndexPath! ? true : false
        
        
        cell.checkmarkIcon.isHidden = (indexPath.row == selectedIndexPath) ? false : true
        
        // images not supported for text alignment center
        if (self.items[indexPath.row].image != nil)  && self.configuration.cellTextLabelAlignment != .center {
            
            let imageOriginX:CGFloat
            
            if self.configuration.cellTextLabelAlignment == .left     {
                imageOriginX = cell.textLabel!.frame.origin.x - self.configuration.cellLabelImageDistance - self.configuration.cellImageSize
            } else {
                imageOriginX = cell.textLabel!.frame.origin.x  + cell.textLabel!.frame.size.width + self.configuration.cellLabelImageDistance
            }
            
            
            cell.imageView?.frame = CGRect(x: imageOriginX, y: (self.configuration.cellHeight - self.configuration.cellImageSize) / 2, width: self.configuration.cellImageSize, height: self.configuration.cellImageSize)
            cell.imageView?.clipsToBounds = true
            cell.imageView?.contentMode = .center
            cell.contentView.addSubview(cell.imageView!)
            
            if  let _ = self.configuration.cellTintColor {
                cell.imageView!.image = self.items[indexPath.row].image!.withRenderingMode(.alwaysTemplate)
            } else {
                 cell.imageView!.image = self.items[indexPath.row].image!
            }

        }
        
        

        return cell
    }
    
    // Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        self.selectRowAtIndexPathHandler!(indexPath.row)
        self.reloadData()
        let cell = tableView.cellForRow(at: indexPath) as? BTTableViewCell
        cell?.contentView.backgroundColor = self.configuration.cellSelectionColor
        cell?.textLabel?.textColor = self.configuration.selectedCellTextLabelColor
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? BTTableViewCell
        cell?.checkmarkIcon.isHidden = true
        cell?.contentView.backgroundColor = self.configuration.cellBackgroundColor
        cell?.textLabel?.textColor = self.configuration.cellTextLabelColor
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.configuration.shouldKeepSelectedCellColor == true {
            cell.backgroundColor = self.configuration.cellBackgroundColor
            cell.contentView.backgroundColor = (indexPath.row == selectedIndexPath) ? self.configuration.cellSelectionColor : self.configuration.cellBackgroundColor
        }
    }
}

// MARK: Table view cell
class BTTableViewCell: UITableViewCell {
    let checkmarkIconWidth: CGFloat = 50

    
    var checkmarkIcon: UIImageView!
    var cellContentFrame: CGRect!
    var configuration: BTConfiguration!

    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, configuration: BTConfiguration) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configuration = configuration
        
        // Setup cell
        cellContentFrame = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.width)!, height: self.configuration.cellHeight)
        self.contentView.backgroundColor = self.configuration.cellBackgroundColor
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.textLabel!.textColor = self.configuration.cellTextLabelColor
        self.textLabel!.font = self.configuration.cellTextLabelFont
        self.textLabel!.textAlignment = self.configuration.cellTextLabelAlignment
        if self.textLabel!.textAlignment == .center {
            self.textLabel!.frame = CGRect(x: 0, y: 0, width: cellContentFrame.width, height: cellContentFrame.height)
        } else if self.textLabel!.textAlignment == .left {
            self.textLabel!.frame = CGRect(x: self.configuration.cellTextLabelHorizontalMargin, y: 0, width: cellContentFrame.width, height: cellContentFrame.height)
        } else {
            self.textLabel!.frame = CGRect(x: -self.configuration.cellTextLabelHorizontalMargin, y: 0, width: cellContentFrame.width, height: cellContentFrame.height)
        }

        
        self.tintColor = self.configuration.cellTintColor
        
        // Checkmark icon
        if self.textLabel!.textAlignment == .center {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: cellContentFrame.width - checkmarkIconWidth, y: (cellContentFrame.height - 30)/2, width: 30, height: 30))
        } else if self.textLabel!.textAlignment == .left {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: cellContentFrame.width - checkmarkIconWidth, y: (cellContentFrame.height - 30)/2, width: 30, height: 30))
        } else {// right
            self.checkmarkIcon = UIImageView(frame: CGRect(x: self.configuration.cellLabelImageDistance + checkmarkIconWidth, y: (cellContentFrame.height - 30)/2, width: 30, height: 30))
        }
        self.checkmarkIcon.isHidden = true
        

        if let _ = self.configuration.cellTintColor {
            self.checkmarkIcon.image = self.configuration.checkMarkImage.withRenderingMode(.alwaysTemplate)
        } else {
                 self.checkmarkIcon.image = self.configuration.checkMarkImage
        }
   
        self.checkmarkIcon.contentMode = UIViewContentMode.scaleAspectFill
        self.contentView.addSubview(self.checkmarkIcon)
        
        
        
        // Separator for cell
        let separator = BTTableCellContentView(frame: cellContentFrame)
        if let cellSeparatorColor = self.configuration.cellSeparatorColor {
            separator.separatorColor = cellSeparatorColor
        }
        self.contentView.addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.bounds = cellContentFrame
        self.contentView.frame = self.bounds
    }
}

// Content view of table view cell
class BTTableCellContentView: UIView {
    var separatorColor: UIColor = UIColor.black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        self.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        
        // Set separator color of dropdown menu based on barStyle
        context?.setStrokeColor(self.separatorColor.cgColor)
        context?.setLineWidth(1)
        context?.move(to: CGPoint(x: 0, y: self.bounds.size.height))
        context?.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height))
        context?.strokePath()
    }
}

extension UIViewController {
    // Get ViewController in top present level
    var topPresentedViewController: UIViewController? {
        var target: UIViewController? = self
        while (target?.presentedViewController != nil) {
            target = target?.presentedViewController
        }
        return target
    }
    
    // Get top VisibleViewController from ViewController stack in same present level.
    // It should be visibleViewController if self is a UINavigationController instance
    // It should be selectedViewController if self is a UITabBarController instance
    var topVisibleViewController: UIViewController? {
        if let navigation = self as? UINavigationController {
            if let visibleViewController = navigation.visibleViewController {
                return visibleViewController.topVisibleViewController
            }
        }
        if let tab = self as? UITabBarController {
            if let selectedViewController = tab.selectedViewController {
                return selectedViewController.topVisibleViewController
            }
        }
        return self
    }
    
    // Combine both topPresentedViewController and topVisibleViewController methods, to get top visible viewcontroller in top present level
    var topMostViewController: UIViewController? {
        return self.topPresentedViewController?.topVisibleViewController
    }
}
