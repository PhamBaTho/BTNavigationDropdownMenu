![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/BTNavigationDropdownLogo.png)

[![Pod Version](https://img.shields.io/cocoapods/v/BTNavigationDropdownMenu.svg?style=flat)](http://cocoadocs.org/docsets/BTNavigationDropdownMenu/)
[![Build Status](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu.svg?branch=master)](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE)

## Introduction:
The elegant dropdown menu, written in **Swift**, appears underneath navigation bar to display a list of related items when a user click on the navigation title.

![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/Demo.gif)

## Installation:

**BTNavigationDropdownMenu** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BTNavigationDropdownMenu'
```
Go ahead and **import** BTNavigationDropdownMenu into your own Swift files 
```swift
import BTNavigationDropdownMenu
```

## Usage:
### Subclassing
Start by creating an Array that contains strings as **elements of dropdown list**:
```swift
let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
```
Create a **new instance** of BTNavigationDropdownMenu. The frame of this instance represents **the touchable area** of navigation title to show dropdown menu:
```swift
let menuView = BTNavigationDropdownMenu(frame:  CGRectMake(0.0, 0.0, 300, 44), title: items.first!, items: items, containerView: self.view)
```
Set **title of navigation bar** as menuView:
```swift
self.navigationItem.titleView = menuView
```
Call BTNavigationDropdownMenu closure to get **the index of selected cell**:
```swift
menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            println("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = items[indexPath]
}
```

### Customization
Once you have assigned the items and frame for dropdown menu, you can custom the look and the feel of menu. You can override these properties for your favor:

`cellHeight` **- The height of the cell.** *Default is 50*

`cellBackgroundColor` **- The color of the cell background.** *Default is whiteColor()*

`cellTextLabelColor` **- The color of the text inside cell.** *Default is darkGrayColor()*

`cellTextLabelFont` **- The font of the text inside cell.** *Default is HelveticaNeue-Bold, size 19*

`cellSelectionColor`  **- The color of the cell when the cell is selected.** *Default is lightGrayColor()*

`checkMarkImage`  **- The checkmark icon of the cell.**

`animationDuration`  **- The animation duration of showing/hiding menu.** *Default is 0.3s*

`bounceOffset`  **- The value of bounce offset.** *Default is 10*

`arrowImage`  **- The arrow next to navigation title**

`arrowPadding`  **- The padding between navigation title and arrow.** *Default is 15*

`maskBackgroundColor`  **- The color of the mask layer.** *Default is blackColor()*

`maskBackgroundOpacity`  **- The opacity of the mask layer.** *Default is 0.3*

## Requirement
- iOS 8.0+
- Xcode 6.1

## License
BTNavigationDropdownMenu is available under the MIT License. See the [LICENSE](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE) for details.
