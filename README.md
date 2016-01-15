![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/BTNavigationDropdownLogo.png)

[![Pod Version](https://img.shields.io/cocoapods/v/BTNavigationDropdownMenu.svg?style=flat)](http://cocoadocs.org/docsets/BTNavigationDropdownMenu/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE)
![Language](https://img.shields.io/badge/language-Swift-brightgreen.svg?style=flat)
<!--[![Build Status](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu.svg?branch=master)](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu)-->

## Introduction:
The elegant dropdown menu, written in **Swift**, appears underneath navigation bar to display a list of related items when a user click on the navigation title.

![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/Demo.gif)

## Installation:
**BTNavigationDropdownMenu** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod 'BTNavigationDropdownMenu'
```
Go ahead and **import** BTNavigationDropdownMenu into your own Swift files 
```swift
import BTNavigationDropdownMenu
```
Note: This library mainly supports for **Xcode 7, Swift 2.0** and embedded frameworks. For older versions of XCode, use branch [swift-1.2](https://github.com/PhamBaTho/BTNavigationDropdownMenu/tree/swift-1.2)

## Usage:
### Instantiating
Start by creating an Array that contains strings as **elements of dropdown list**:
```swift
let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
```
Create a **new instance** of BTNavigationDropdownMenu:
```swift
let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: items.first!, items: items)
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
Use `menuView.show()` or `menuView.hide()` if you want to show or hide dropdown menu manually.

Use `menuView.isShown` (Boolean type) property to check showing state of dropdown menu.

### Customization
Once you have assigned the items and frame for dropdown menu, you can custom the look and the feel of menu. You can override these properties for your favor:

`cellHeight` **- The height of the cell.** *Default is 50*

`cellBackgroundColor` **- The color of the cell background.** *Default is whiteColor()*

`cellSeparatorColor` **- The color of the cell separator.** *Default is darkGrayColor()*

`cellTextLabelColor` **- The color of the text inside cell.** *Default is darkGrayColor()*

`cellTextLabelFont` **- The font of the text inside cell.** *Default is HelveticaNeue-Bold, size 19*

`cellTextLabelAlignment` **- The alignment of the text inside cell.** *Default is .Left*

`cellSelectionColor`  **- The color of the cell when the cell is selected.** *Default is lightGrayColor()*

`checkMarkImage`  **- The checkmark icon of the cell.**

`animationDuration`  **- The animation duration of showing/hiding menu.** *Default is 0.5s*

`bounceOffset`  **- The value of bounce offset.** *Default is 10*

`arrowImage`  **- The arrow next to navigation title**

`arrowPadding`  **- The padding between navigation title and arrow.** *Default is 15*

`maskBackgroundColor`  **- The color of the mask layer.** *Default is blackColor()*

`maskBackgroundOpacity`  **- The opacity of the mask layer.** *Default is 0.3*

## Requirement
- iOS 8.0+ (Cocoapods with Swift support will only work on iOS 8.0+. Alternatively, you will have to import library manually to your project)
- Xcode 7.0+, Swift 2.0+

## License
BTNavigationDropdownMenu is available under the MIT License. See the [LICENSE](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE) for details.
