# DYBadge

[![Version](https://img.shields.io/cocoapods/v/DYBadge.svg?style=flat)](http://cocoapods.org/pods/DYBadge)
[![License](https://img.shields.io/cocoapods/l/DYBadge.svg?style=flat)](http://cocoapods.org/pods/DYBadge)
[![Platform](https://img.shields.io/cocoapods/p/DYBadge.svg?style=flat)](http://cocoapods.org/pods/DYBadge)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


 DYBadge (written in Swift 4) features pop up badge that can be added as subview to any UIView and its subclasses (except for UIImageView). If the string value of the badge changes from nil (or "nullish") to a valid string value at runtime the badge will appear with a pop up effect. If it switches back to a "nullish" value, it will shrink and disappear.
The class also includes a UIButton  class function (extension) to create a button with an image and a title, which is positioned underneath the image. 

## Example

To checkout the example project, simply clone the repo or download the zip file. 

## Features

* Customise the badge text color, badge color and badge font.
* Set x and y offset to move the badge to a customised position. The default position is the origin (0, 0) of the superview.
* Create a UIButton with image and a button title placed underneath the image and add a DYBadge (see the extension).

## Installation


Installation through Cocoapods or Carthage is recommended. 

Carthage: Simply add the following line to your Cartfile.

github "DominikButz/DYBadge" ~> 1.0

Check out the version history below for the current version.

Afterwards, run "carthage update DYBadge --platform iOS" in the root directory of your project. Follow the steps described in the carthage project on github (click on the carthage compatible shield above). 

Alternatively, install through Cocoapods:

target '[project name]' do
 	pod 'DYBadge', '~> 1.0
end

Make sure to import DYBadge into your View Controller subclass:

```Swift
import DYBadge
```

## Usage

Check out the following examples. 

### Code example: Creating a button with a DYBadge


```Swift
 @IBOutlet weak var firstButton: UIButton!  // simply drop a UIButton into the VC from interface builder in storyboard
 

 override func viewDidLoad() {
   super.viewDidLoad()
   
   // you can override the font, text color and badge color like so
   
    let frame = CGRect(x: 0, y: 0, width: 8.0, height: 5.0)  // exact values for width and height are not important, they are change according to the font size
    
    let firstBadge = DYBadge(frame: frame)
        
   firstBadge.badgeColor = UIColor.red
   firstBadge.badgeFont = UIFont(name: "Helvetica Neue", size: 11.0)!
   firstBadge.yOffset = -5.0
   firstBadge.xOffset = self.firstButton.frame.size.width - 3.0
   self.firstButton.addSubview(firstBadge)

   // set a start value if required
   self.firstButton.badgeString = "7"
   
 }

```

![DYBadgeButton example](./gitResources/DYBadgeExample1-small.gif "Badge Button example 1") 

### Code example: Creating a button with image and title

 
```Swift

 @IBOutlet weak var secondButtonItem: UIBarButtonItem!

 override func viewDidLoad() {
	    super.viewDidLoad()
	        
		 let buttonFrame =  CGRect(x: 0, y: 0, width: 25.0, height: 26.0)
       let font = UIFont(name: "Helvetica Neue", size: 11.0)!
       let color = self.view.tintColor
       let filterButton  = UIButton.createImageTitleButton(image:  imageLiteral(resourceName: "filterButton"), title: "Filter", font: font, frame: buttonFrame, tintColor: color!)  // see extension in the DYBadge file
        
      let secondBadge = DYBadge(frame: frame)
        secondBadge.badgeColor = self.view.tintColor
        filterButton.addSubview(secondBadge)
        secondBadge.xOffset = filterButton.frame.size.width
        secondBadge.yOffset = -5.0
        filterButton.addSubview(secondBadge)
        self.secondButtonItem.customView = filterButton
	}
```
![DYBadgeButton example](./gitResources/DYBadgeExample2-small.gif "Badge Button example 2") 

## Change log
#### [Version 1.1](https://github.com/DominikButz/DYBadge/releases/tag/1.1)
The badge is now placed by default at the origin of the superview. Adjust your offsetX and offsetY values accordingly - see the example above. 
#### [Version 1.0.3](https://github.com/DominikButz/DYBadge/releases/tag/1.0.3)
public header fix for carthage
#### [Version 1.0.2](https://github.com/DominikButz/DYBadge/releases/tag/1.0.2)
adding podfile, readme update

#### [Version 1.0.1](https://github.com/DominikButz/DYBadge/releases/tag/1.0.1)
missing source files in example - fix

#### [Version 1.0](https://github.com/DominikButz/DYBadge/releases/tag/1.0)
see deprecated project DYBadgeButton for previous versions. 


## Author

dominikbutz@gmail.com

## License

DYBadge is available under the MIT license. See the LICENSE file for more info.


