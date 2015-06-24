//
//  BTTableViewCell.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/14/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class BTTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.redColor()
        self.textLabel?.textAlignment = NSTextAlignment.Center
        
        var separator = BTTableCellContentView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, self.contentView.frame.height))
        println(UIScreen.mainScreen().bounds.width)
        separator.backgroundColor = UIColor.clearColor()
        self.contentView.addSubview(separator)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
