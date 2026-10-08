![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/BTNavigationDropdownLogo.png)

[![Pod Version](https://img.shields.io/cocoapods/v/BTNavigationDropdownMenu.svg?style=flat)](http://cocoadocs.org/docsets/BTNavigationDropdownMenu/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE)
![Language](https://img.shields.io/badge/language-Swift-brightgreen.svg?style=flat)
<!--[![Build Status](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu.svg?branch=master)](https://travis-ci.org/PhamBaTho/BTNavigationDropdownMenu)-->

## Introduction
The elegant yet functional dropdown menu, written in Swift, appears underneath the navigation bar to display a list of defined items when a user clicks on the navigation title.

![alt tag](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/Assets/Demo.gif)

## Installation
### CocoaPods
**BTNavigationDropdownMenu** is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod 'BTNavigationDropdownMenu'
```
Go ahead and **import** BTNavigationDropdownMenu into your own Swift files 
```swift
import BTNavigationDropdownMenu
```

## Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](https://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate BTNavigationDropdownMenu into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "PhamBaTho/BTNavigationDropdownMenu" ~> 0.7
```

Run `carthage update` to build the framework and drag the built `BTNavigationDropdownMenu.framework` into your Xcode project.

### Swift Package Manager
Once you have your Swift package set up, adding BTNavigationDropdownMenu as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/PhamBaTho/BTNavigationDropdownMenu.git", .upToNextMajor(from: "1.0"))
]
```

## Usage
### Instantiate
Start by creating an Array that contains strings as **elements of a dropdown list**:
```swift
let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
```
Create a **new instance** of BTNavigationDropdownMenu:
```swift
let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.title("Dropdown Menu"), items: items)
```
or like this:
```swift
let menuView = BTNavigationDropdownMenu(title: BTTitle.index(1), items: items)
```

BTTitle is an enum. We can set `BTTitle.title(string)` or `BTTitle.index(Int)` (Note: `BTTitle.index` is the index of defined `items` array).

By default, `navigationController` is the topmost navigation controller and `containerView` is keyWindow. 

(`keyWindow` is recommended for `containerView` so that the black overlay can cover the whole screen. In some cases, `keyWindow` doesn't work properly, like using with side menu (e.g. SWRevealViewController), the dropdown menu doesn't move along with the parent view or navigation controller. To workaround this issue, you can use `self.navigationController!.view`.)

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
`menuView.show()` or `menuView.hide()` to show or hide dropdown menu manually.

`menuView.toggle()` to toogle dropdown menu shown/hide.

`menuView.isShown` (Boolean type) property to check showing state of dropdown menu.

`menuView.updateItems(items: [AnyObject])` to update items in dropdown menu.

### Customization
First, assign the items and frame for the dropdown menu. Then, customize the look and feel of the menu by overriding these properties:

| Name | Description | Default value |
|---|---|:---:|
| `navigationBarTitleFont` |  Navigation bar title font | System font, bold, size 17 |
| `cellHeight` | Cell height | 50 |
| `arrowImage` | Arrow next to the navigation title | Provided image |
| `arrowPadding` | Padding between the navigation title and arrow | 15 |
| `cellBackgroundColor` | Cell background color | UIColor.white |
| `cellSeparatorColor` | Cell separator color | UIColor.darkGray |
| `cellTextLabelColor` | Text color inside of the cell | UIColor.darkGray |
| `cellTextLabelFont` | Text font inside the cell | System font, bold, size 17 |
| `cellTextLabelAlignment` | Text alignment inside of the cell | NSTextAlignment.left |
| `cellSelectionColor` | Selected color of the cell | UIColor.lightGray |
| `checkMarkImage` | Checkmark icon for the cell | Provided image |
| `animationDuration` | Animation duration for showing/hiding of the menu | 0.3 |
| `maskBackgroundColor` | Mask layer color | UIColor.black |
| `maskBackgroundOpacity` | Opacity of the mask layer | 0.3 |
| `menuTitleColor` | Title color displayed in the menu | UIColor.lightGray |
| `shouldKeepSelectedCellColor` | Selected cell color visibility when menu is shown | false |
| `shouldChangeTitleText` | Ability to change the selected title text | true |
| `selectedCellTextLabelColor` | Selected cell text label color | UIColor.darkGray |
| `arrowTintColor` | Tint color of the arrow | UIColor.white |

## Requirement
- iOS 9.0+

## Changelog
See the [CHANGELOG](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/CHANGELOG.md) for details

## License
BTNavigationDropdownMenu is available under the MIT License. See the [LICENSE](https://github.com/PhamBaTho/BTNavigationDropdownMenu/blob/master/LICENSE) for details.
