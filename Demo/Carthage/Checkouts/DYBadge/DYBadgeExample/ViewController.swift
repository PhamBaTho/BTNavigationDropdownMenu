//
//  ViewController.swift
//  DYBadgeExample
//
//  Created by Dominik Butz on 09.04.18.
//  Copyright © 2018 Duoyun. All rights reserved.
//

import UIKit
import DYBadge

class ViewController: UIViewController {

    @IBOutlet weak var firstSlider: UISlider!
    @IBOutlet weak var secondSlider: UISlider!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstSlider.isContinuous = false
          self.firstSlider.value = 0
        
        let frame = CGRect(x: 0, y: 0, width: 8.0, height: 5.0)
        let firstBadge = DYBadge(frame: frame)
        
        firstBadge.badgeColor = UIColor.red
        firstBadge.badgeFont = UIFont(name: "Helvetica Neue", size: 11.0)!
        firstBadge.yOffset = -5.0
        self.firstButton.addSubview(firstBadge)

        
        self.secondSlider.isContinuous = false
        let buttonFrame =  CGRect(x: 0, y: 0, width: 25.0, height: 26.0)
        let font = UIFont(name: "Helvetica Neue", size: 11.0)!
        let color = self.view.tintColor
        let filterButton  = UIButton.createImageTitleButton(image: #imageLiteral(resourceName: "filterButton"), title: "Filter", font: font, frame: buttonFrame, tintColor: color!)
        
      let secondBadge = DYBadge(frame: frame)
        secondBadge.badgeColor = self.view.tintColor
        filterButton.addSubview(secondBadge)
        secondBadge.xOffset = -15.0
        secondBadge.yOffset = -5.0
        filterButton.addSubview(secondBadge)
        self.secondButtonItem.customView = filterButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        print("slider value changed")
        if sender == self.firstSlider {
            let intValue = Int(sender.value)
            print("first slider value")
            if let badge  = self.firstButton.getBadge() {
                print("badge first button found")
                badge.badgeString = intValue != 0 ? "\(intValue)" : nil
            }

        } else {
            // second slider
            let filterButton = self.secondButtonItem.customView as! UIButton
            if let badge = filterButton.getBadge() {
                print("badge second button found")
                badge.badgeString = "\(Int(sender.value))"
            }

        }
        
    }

}

