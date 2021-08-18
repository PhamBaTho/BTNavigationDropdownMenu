// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BTNavigationDropdownMenu",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "BTNavigationDropdownMenu",
            targets: ["BTNavigationDropdownMenu"]
        )
    ],
    targets: [
        .target(
            name: "BTNavigationDropdownMenu",
            path: "Source",
            resources: [
                .copy("BTNavigationDropdownMenu.bundle")
            ]
        )
    ]
)
