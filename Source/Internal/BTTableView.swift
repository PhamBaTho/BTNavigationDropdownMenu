//
//  BTTableView.swift
//
//  Copyright (c) 2017 PHAM BA THO (phambatho@gmail.com). All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class BTTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // Public properties
    var configuration: BTConfiguration!
    var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    // Private properties
    var items: [String] = []
    var selectedIndexPath: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, items: [String], title: String, configuration: BTConfiguration) {
        super.init(frame: frame, style: UITableView.Style.plain)
        
        self.items = items
        self.selectedIndexPath = items.firstIndex(of: title)
        self.configuration = configuration
        
        // Setup table view
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.clear
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        //        self.separatorEffect = UIBlurEffect(style: .Light)
        self.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        self.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let hitView = super.hitTest(point, with: event) , hitView.isKind(of: BTTableCellContentView.self) {
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
        let cell = BTTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell", configuration: self.configuration)
        cell.textLabel?.text = self.items[(indexPath as NSIndexPath).row]
        cell.checkmarkIcon.isHidden = ((indexPath as NSIndexPath).row == selectedIndexPath) ? false : true
        return cell
    }
    
    // Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = (indexPath as NSIndexPath).row
        self.selectRowAtIndexPathHandler!((indexPath as NSIndexPath).row)
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
            cell.contentView.backgroundColor = ((indexPath as NSIndexPath).row == selectedIndexPath) ? self.configuration.cellSelectionColor : self.configuration.cellBackgroundColor
        }
    }
}
