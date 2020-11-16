## [0.7](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.7) (16-11-2020)
### Fixed
- Update deprecated index(of:) to firstIndex(of:) [(#156)](https://github.com/PhamBaTho/BTNavigationDropdownMenu/pull/156)
- Remove ImplicitlyUnwrappedOptional to be compatible with Swift 5.

### Improved
- Update project configuration to be compatible with Swift 5 and Xcode 10.2+
- Use system font as default value of `navigationBarTitleFont`.

## [0.6](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.6) (19-02-2019)
- Merged PR [#145](https://github.com/PhamBaTho/BTNavigationDropdownMenu/pull/145): Carthage support.

## [0.5](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.5) (19-08-2018)
- Support Xcode 10 and Swift 4.2

## [0.4.1](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.4.1) (01-08-2016)
- Merge PR [#71](https://github.com/PhamBaTho/BTNavigationDropdownMenu/pull/71): Now you can configure selectedCellTextLabelColor. arrowTintColor, navigationBarTitleFont
- Merge PR [#75](https://github.com/PhamBaTho/BTNavigationDropdownMenu/pull/75): Now you can keep navigation title static when selecting items in dropdown menu
- Change keepSelectedCellColor to shouldKeepSelectedCellColor
- Fix a bug in updateItems() when updating menu view after HTTP request.

## [0.4](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.4) (23-06-2016)
- Resolve issue [#57](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/57) and [#63](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/63). Now you can scroll to the last one when the list is longer than screen's height.
- Resolve issue [#62](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/62) (Alternate scope initialization). Now you can initialize menuView where `title` parameter doesn't need to be one of the items array.
- Resolve issue [#68](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/68). Now, you can use `updateItems(items: [AnyObject])` to update items for the dropdown menu after it has been initialized.
- Add containView as parameter when initializing menuView.

## [0.3](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.3) (17-04-2016)
- Add toggle() functions
- Add keepSelectedCellColor property
- Fixed issues [#41](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/41)
- Fixed issues [#38](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/38)

## [0.2.1](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.2.1) (10-01-2016)
- Public show() and hide() functions
- Public isShown property

## [0.2](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.2) (15-12-2015)
- Passed navigationController when initializing
- Added the alignment of the text inside cell
- Fixed issue [#16](https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/16): Sometimes navigationController is nil

## [0.1.8](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.8) (15-09-2015)
- Fixed issue: Sometimes navigationController is nil

## [0.1.7](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.7) (04-09-2015)
- Use optional for some properties that relating to navigation controller

## [0.1.6](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.6) (28-08-2015)
- No need to use containerView param when initializing menuView now

## [0.1.5](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.5) (27-08-2015)
- Support device orientation
- Support Split View on iPad

## [0.1.4](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.4) (26-08-2015)
- Fixed issue [#5] (https://github.com/PhamBaTho/BTNavigationDropdownMenu/issues/5). The dropdown overlay appears overtop the tab bar now
- Refactoring and clean up

## [0.1.3](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.3) (25-07-2015)
- Use `usingSpringWithDamping` instead of `contentOffset` for show/hide animation

## [0.1.2](https://github.com/PhamBaTho/BTNavigationDropdownMenu/releases/tag/0.1.2) (21-07-2015)
- Allow change of arrow image after creation of menu
