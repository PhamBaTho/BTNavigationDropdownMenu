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
pod 'BTNavigationDropdownMenu', :git => 'https://github.com/PhamBaTho/BTNavigationDropdownMenu.git', :branch => 'swift-2.3'
```
Go ahead and **import** BTNavigationDropdownMenu into your own Swift files 
```swift
import BTNavigationDropdownMenu
```
Note: This library mainly supports for **Xcode 7, Swift 3.0** and embedded frameworks.

## Usage:
### Instantiating
Start by creating an Array that contains strings as **elements of dropdown list**:
```swift
let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
```
Create a **new instance** of BTNavigationDropdownMenu:
```swift
let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "Dropdown Menu", items: items)
```
or just simple like this:
```swift
let menuView = BTNavigationDropdownMenu(title: items[0], items: items)
```
By default, `navigationController` is the top most navigation controller and `containerView` is keyWindow. 

(`keyWindow` is recommended for `containerView` because in this way, the black overlay can cover the whole screen. But in some cases, `keyWindow` doesn't work properly, like using with side menu, (e.g. SWRevealViewController), the dropdown menu didn't move along with their parent view controller or navigation controller. To resolve this issue, you can use `self.navigationController!.view` instead.)

Set **title of navigation bar** as menuView:
```swift
self.navigationItem.titleView = menuView
```
Call BTNavigationDropdownMenu closure to get **the index of selected cell**:
```swift
menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = items[indexPath]
}
```
Use `menuView.show()` or `menuView.hide()` if you want to show or hide dropdown menu manually.

Use `menuView.toggle()` to toogle dropdown menu shown/hide.

Use `menuView.isShown` (Boolean type) property to check showing state of dropdown menu.

Use `menuView.updateItems(items: [AnyObject])` to update items in dropdown menu if needed.

### Customization
Once you have assigned the items and frame for dropdown menu, you can custom the look and the feel of menu. You can override these properties for your favor:

`cellHeight` **- The height of the cell.** *Default is 50*

`cellBackgroundColor` **- The color of the cell background.** *Default is whiteColor()*

`cellSeparatorColor` **- The color of the cell separator.** *Default is darkGrayColor()*

`cellTextLabelColor` **- The color of the text inside cell.** *Default is darkGrayColor()*

`cellTextLabelFont` **- The font of the text inside cell.** *Default is HelveticaNeue-Bold, size 17*

`navigationBarTitleFont` **- The font of the navigation bar title.** *Default is HelveticaNeue-Bold, size 17*

`cellTextLabelAlignment` **- The alignment of the text inside cell.** *Default is .Left*

`cellSelectionColor`  **- The color of the cell when the cell is selected.** *Default is lightGrayColor()*

`checkMarkImage`  **- The checkmark icon of the cell.**

`animationDuration`  **- The animation duration of showing/hiding menu.** *Default is 0.5s*

`arrowImage`  **- The arrow next to navigation title**

`arrowPadding`  **- The padding between navigation title and arrow.** *Default is 15*

`maskBackgroundColor`  **- The color of the mask layer.** *Default is blackColor()*

`maskBackgroundOpacity`  **- The opacity of the mask layer.** *Default is 0.3*

`shouldKeepSelectedCellColor` **- The boolean value that decides if selected color of cell is visible when the menu is shown.** *Default is false*

`shouldChangeTitleText` **- The boolean value that decides if you want to change the title text when a cell is selected.** *Default is true*

`selectedCellTextLabelColor`  **- The color of the selected cell text label.** *Default is darkGrayColor()*

`arrowTintColor`  **- The tint color of the arrow.** *Default is whiteColor()*

## Requirement
- iOS 8.0+ (CocoaPods with Swift support will only work on iOS 8.0+. Alternatively, you will have to import library manually to your project)
- Xcode 7.0+, Swift 2.0+

## Changelog
See the [CHANGELOG](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/CHANGELOG.md) for details

## License
BTNavigationDropdownMenu is available under the MIT License. See the [LICENSE](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE) for details.
