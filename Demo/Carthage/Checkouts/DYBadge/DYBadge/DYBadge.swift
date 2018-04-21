//
//  DYBadge.swift
//  Flat Chat
//
//  Created by Dominik Butz on 08.04.18.
//  Copyright © 2018 Duoyun. All rights reserved.
//

import UIKit

@IBDesignable public class DYBadge: UILabel {

    /// The text of the badge
   @IBInspectable open var badgeString:String? {
        didSet{
            
            let wasNullishBefore = self.isNullish(self.text)
            
            self.text = badgeString
            
            self.setBadgeSizeAndFrame(animated: !wasNullishBefore)
            
            var transform: CGAffineTransform?
            var shouldHide: Bool?
            
            if self.isHidden && self.isNullish(badgeString) == false {
                // is hidden but should appear
                self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                transform = CGAffineTransform.identity
                shouldHide = false
                
            }
                
            else if self.isHidden == false && self.isNullish(badgeString) {
                // should disappear
                transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                shouldHide = true
                
            } else {
                
                return
            }
            
            self.animateBadgeTransform(shouldHide: shouldHide!,transform: transform!)
            
        }
    }
    
    /// The font of the badge text
// open var badgeFont: UIFont = UIFont(name: "Helvetica Neue", size: 10.0)! {
//        didSet {
//            print("setting font")
//            self.font = badgeFont
//            self.setBadgeSizeAndFrame(animated: false)
//        }
//    }
    


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    public override func awakeFromNib() {
        super.awakeFromNib()

        self.setupBadge()
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupBadge()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBadge()
    }
    
    private func setupBadge() {

     //   self.font = self.badgeFont
        self.textAlignment = .center
                
        self.setBadgeSizeAndFrame(animated: false)
        
        self.isHidden = self.isNullish(badgeString)
        
        
    }
    
    private func setBadgeSizeAndFrame(animated: Bool) {
        
        if self.isNullish(badgeString) {
            return
        }
        
        let sizeLabel = UILabel()
        sizeLabel.text = self.badgeString!
        sizeLabel.font = self.font
        sizeLabel.sizeToFit()
        let badgeSize = sizeLabel.frame.size

        self.transform = CGAffineTransform.identity
        
        let frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: badgeSize.width + 8.0, height: badgeSize.height + 2.0)
        
        if animated {
            UIView.animate(withDuration: 0.1) {
                self.set(frame: frame)
            }
        } else {
           
            self.set(frame: frame)
            
        }
        
        self.clipsToBounds = true
        
    }
    
    private func set(frame: CGRect) {
        
        self.frame = frame
        self.layer.cornerRadius = self.bounds.height / 2.0
        
    }
    
    
    private func animateBadgeTransform(shouldHide: Bool, transform: CGAffineTransform) {
        
        let springValue:CGFloat = shouldHide ? 0 : 0.4
        
        if shouldHide == false {
            
            self.isHidden = false
            
        }

        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: springValue, initialSpringVelocity: 0, options: [], animations: {
            self.transform = transform
            
        }) { (completed) in
            
            if shouldHide {
                self.isHidden = true
            }
        }
    }
    
    
    
    /// Checks if the badge string is "nullish" (nil, empty string or Int value == 0). overridable
    ///
    /// - Parameters:
    ///   - stringValue: a String
    open func isNullish(_ stringValue: String?)-> Bool {
        
        if stringValue == nil {
            return true
        }
        
        let stringWithoutWhitespaces = stringValue!.components(separatedBy: .whitespaces).joined()
        
        if stringWithoutWhitespaces == "" {
            return true
        }
        
        let intValue = Int(stringWithoutWhitespaces)
        
        if intValue == 0 {
            return true
        }
        
        return false
        
    }
    
    /// Finds the first occurence of a DYBadge if it exists among the superview's subviews
    ///
    /// - Parameters:
    ///   - superview: the superview that hopefully has a DYBadge as one of its subviews
    /// - Returns: a DYBadge object
    class func findBadge(in superview: UIView)->DYBadge? {
        
        let subviews = superview.subviews
        
        for view in subviews {
            if let badge  = view as? DYBadge {
                return badge
            }
        }
        return nil
    }

}


public extension UIView {
    
    /// Finds the first occurence of a DYBadge if it exists among the view's subviews
    /// - Returns: a DYBadge object
   public func getBadge()->DYBadge? {

    for view in self.subviews {
            if let badge  = view as? DYBadge {
                return badge
            }
        }
    return nil
    
    }
    
}

public extension UIButton {
    
    private func alignImageAndTitleVertically(padding: CGFloat = 6.0) {

        let imageSize = self.imageView!.frame.size
        self.titleLabel?.sizeToFit()
        self.titleLabel?.textAlignment = .center
        
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding
//        print("image height: \(imageSize.height)")
//        print("total height: \(totalHeight)")
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }
    
    
    /// Create a UIButton with an image and title - the title is placed underneath the image
    ///
    /// - Parameters:
    ///   - image: a UIImage object
    ///    - title: the title, placed underneath the image.
    ///    - font: the font of the title
    ///  -  frame: the frame of the button's image view. the tint color
    /// - Returns: a UIButton
    public class func createImageTitleButton(image: UIImage, title: String, font: UIFont, frame: CGRect, tintColor: UIColor)->UIButton {
        
        let button = UIButton(frame: frame)
        button.contentMode = .scaleAspectFit
        button.setImage(image, for: .normal)
        button.imageView!.contentMode = .scaleAspectFit
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.tintColor =  tintColor
        button.setTitleColor(tintColor, for: .normal)
        button.alignImageAndTitleVertically(padding: 0)
        return button
        
    }
    

}
