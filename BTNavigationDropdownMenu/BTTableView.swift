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
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, items: [AnyObject]) {
        super.init(frame: frame, style: UITableViewStyle.Plain)
        
        self.items = items
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.tableFooterView = UIView(frame: CGRectZero)

        var headerView = UIView(frame: CGRectMake(0, 0, self.frame.width, 300))
        headerView.backgroundColor = UIColor.redColor()
        self.tableHeaderView = headerView
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        var cell = BTTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        cell.textLabel!.text = self.items[indexPath.row] as? String
        return cell
    }
 }
