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
    
   @IBOutlet weak var dogImageView: UIImageView!
    
    @IBOutlet weak var dogBadge: DYBadge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstSlider.isContinuous = false
          self.firstSlider.value = 0
        
        let frame = CGRect(x: self.firstButton.frame.size.width - 3.0, y: -5.0, width: 8.0, height: 5.0)
        let firstBadge = DYBadge(frame: frame)
        
      let font = UIFont(name: "HelveticaNeue-Bold", size: 10.0)!
       
       firstBadge.font = font
        firstBadge.backgroundColor = UIColor.red
        firstBadge.textColor = UIColor.white

        self.firstButton.addSubview(firstBadge)

        
        self.secondSlider.isContinuous = false
        
        let buttonFrame =  CGRect(x: 0, y: 0, width: 25.0, height: 26.0)
    
        let filterButton  = UIButton.createImageTitleButton(image: #imageLiteral(resourceName: "filterButton"), title: "Filter", font: font, frame: buttonFrame, tintColor: self.view.tintColor)
        
        let secondBadgeFrame =  CGRect(x: buttonFrame.size.width, y: -5.0, width: 8.0, height: 5.0)
        
      let secondBadge = DYBadge(frame: secondBadgeFrame)
        secondBadge.backgroundColor = self.view.tintColor
        secondBadge.textColor = UIColor.white
        secondBadge.font = font
        filterButton.addSubview(secondBadge)

        self.secondButtonItem.customView = filterButton
        
        // dog badge
       self.dogBadge.badgeString = "0"

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
                badge.badgeString = "\(intValue)"
            }
            
            self.dogBadge.badgeString = intValue > 0 ?  "update" : "0"

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

