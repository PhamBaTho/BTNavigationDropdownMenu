![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/BTNavigationDropdownLogo.png)

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE)
![swift](https://img.shields.io/badge/swift-5.0-red.svg)
<!--[![Build Status](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu.svg?branch=master)](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu)-->

## 我的更新 
>## What is new
* support Swift 5.0
* fix the problem that when title is too long will not display normally

## Introduction:
This elegant **Swift** dropdown menu appears underneath the navigation bar to display a list of related items when a user clicks on the navigation title.

![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/Demo.gif)

## Installation:
**NavigationDropdownMenu** is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod 'NavigationDropdownMenu', '~> 5.0.0'
```
Go ahead and **import** NavigationDropdownMenu into your own Swift files 
```swift
import NavigationDropdownMenu
```
Note: This library supports for **Xcode 10.2 Swift 5** and embedded frameworks.

## Usage:
### Instantiate
Start by creating an Array that contains strings as **elements of a dropdown list**:
```swift
let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
```
Create a **new instance** of NavigationDropdownMenu:
```swift
let menuView = NavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: Title.title("Dropdown Menu"), items: items)
```
or like this:
```swift
let menuView = NavigationDropdownMenu(title: Title.index(1), items: items)
```

Title is an enum. We can set `Title.title(string)` or `Title.index(Int)` (Note: `Title.index` is the index of defined `items` array).

By default, `navigationController` is the topmost navigation controller and `containerView` is keyWindow. 

(`keyWindow` is recommended for `containerView` so that the black overlay can cover the whole screen. In some cases, `keyWindow` doesn't work properly, like using with side menu, (e.g. SWRevealViewController), the dropdown menu doesn't move along with the parent view or navigation controller. To workaround this issue, you can use `self.navigationController!.view`.)

Set **title of navigation bar** as menuView:
```swift
self.navigationItem.titleView = menuView
```
Call NavigationDropdownMenu closure to get **the index of selected cell**:
```swift
menuView.didSelectItemAtIndexHandler = {[weak self] (indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = items[indexPath]
}
```
`menuView.show()` or `menuView.hide()` to show or hide dropdown menu manually.

`menuView.toggle()` to toogle dropdown menu shown/hide.

`menuView.isShown` (Boolean type) property to check showing state of dropdown menu.

`menuView.updateItems(items: [AnyObject])` to update items in dropdown menu.

### Customization
First, assign the items and frame for the dropdown menu. Then, customize the look and feel of the menu by overriding these properties:

`cellHeight` **- Cell height** *Default is 50*

`cellBackgroundColor` **- Cell background color** *Default is whiteColor()*

`cellSeparatorColor` **- Cell separator color** *Default is darkGrayColor()*

`cellTextLabelColor` **- Text color inside of the cell** *Default is darkGrayColor()*

`cellTextLabelFont` **- Font inside the cell** *Default is HelveticaNeue-Bold, size 17*

`navigationBarTitleFont` **- Navigation bar title font** *Default is HelveticaNeue-Bold, size 17*

`cellTextLabelAlignment` **- Text alignment inside of the cell** *Default is .Left*

`cellSelectionColor`  **- Selected color of the cell** *Default is lightGrayColor()*

`checkMarkImage`  **- Checkmark icon for the cell.**

`animationDuration`  **- Animation duration for showing/hiding of the menu** *Default is 0.5s*

`arrowImage`  **- Arrow next to the navigation title**

`arrowPadding`  **- Padding between the navigation title and arrow.** *Default is 15*

`maskBackgroundColor`  **- Mask layer color** *Default is blackColor()*

`maskBackgroundOpacity`  **- Opacity of the mask layer** *Default is 0.3*

`menuTitleColor`  **- Title color displayed in the menu.** *Default is lightGrayColor()*

`shouldKeepSelectedCellColor` **- Selected cell color visibility when menu is shown** *Default is false*

`shouldChangeTitleText` **- Ability to change the selected title text** *Default is true*

`selectedCellTextLabelColor`  **- Selected cell text label color** *Default is darkGrayColor()*

`arrowTintColor`  **- Tint color of the arrow.** *Default is whiteColor()*

## Requirement
- iOS 8.0+ (CocoaPods with Swift support will only work on iOS 8.0+. Alternatively, you will have to import library manually to your project)
- Xcode 9.0+, Swift 4.0

## Changelog
See the [CHANGELOG](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/CHANGELOG.md) for details

## License
BTNavigationDropdownMenu is available under the MIT License. See the [LICENSE](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE) for details.
