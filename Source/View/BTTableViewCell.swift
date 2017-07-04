//
//  BTTableViewCell.swift
//  Demo
//
//  Created by Manuel Gomes on 06/02/2017.
//  Copyright © 2017 PHAM BA THO. All rights reserved.
//

import UIKit

// MARK: Table view cell
class BTTableViewCell: UITableViewCell {
    let checkmarkIconWidth: CGFloat = 50
    let horizontalMargin: CGFloat = 20
    
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
            self.textLabel!.frame = CGRect(x: horizontalMargin, y: 0, width: cellContentFrame.width, height: cellContentFrame.height)
        } else {
            self.textLabel!.frame = CGRect(x: -horizontalMargin, y: 0, width: cellContentFrame.width, height: cellContentFrame.height)
        }
        
        // Checkmark icon
        if self.textLabel!.textAlignment == .center {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: cellContentFrame.width - checkmarkIconWidth, y: (cellContentFrame.height - 30)/2, width: 30, height: 30))
        } else if self.textLabel!.textAlignment == .left {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: cellContentFrame.width - checkmarkIconWidth, y: (cellContentFrame.height - 30)/2, width: 30, height: 30))
        } else {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: horizontalMargin, y: (cellContentFrame.height - 30)/2, width: 30, height: 30))
        }
        self.checkmarkIcon.isHidden = true
        self.checkmarkIcon.image = self.configuration.checkMarkImage
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
