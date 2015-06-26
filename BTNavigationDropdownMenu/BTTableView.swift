//
//  BTTableView.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/14/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class BTTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var items: [AnyObject]!
    
    var selectedIndexPath: Int!
    
    var hideTableHandler: (() -> ())?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, items: [AnyObject]) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        
        self.items = items
        self.selectedIndexPath = 0
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.tableFooterView = UIView(frame: CGRectZero)

        var headerView = UIView(frame: CGRectMake(0, 0, self.frame.width, 300))
        headerView.backgroundColor = BTNavigationDropdownMenu.cellBackgroundColor
        self.tableHeaderView = headerView
    }
    
    // Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = BTTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel!.text = self.items[indexPath.row] as? String
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
        self.hideTableHandler!()
        self.reloadData()
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! BTTableViewCell
        cell.contentView.backgroundColor = BTNavigationDropdownMenu.cellSelectionColor
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! BTTableViewCell
        cell.checkmarkIcon.hidden = true
        cell.contentView.backgroundColor = BTNavigationDropdownMenu.cellBackgroundColor
    }
}
