//
//  BTTableViewCell.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/14/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class BTTableViewCell: UITableViewCell {
    
    var checkmarkIcon: UIImageView!
    
    var setSelectedClosure: (() -> ())?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let cellContentFrame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, self.contentView.frame.height)
        self.contentView.backgroundColor = BTNavigationDropdownMenu.cellBackgroundColor
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.textLabel?.textAlignment = NSTextAlignment.Left
        self.textLabel?.textColor = BTNavigationDropdownMenu.cellTextLabelColor
        self.textLabel?.font = BTNavigationDropdownMenu.cellTextLabelFont
        
        // Checkmark icon
        self.checkmarkIcon = UIImageView(frame: CGRectMake(UIScreen.mainScreen().bounds.width - 40, (self.contentView.frame.height - 30)/2, 30, 30))
        self.checkmarkIcon.hidden = true
        self.checkmarkIcon.image = UIImage(named: "checkmark_icon")
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
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

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
