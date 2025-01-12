// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RThemeEngine",
    products: [
        .library(
            name: "RThemeEngine",
            targets: ["RThemeEngine"]
        ),
    ],
    targets: [
        .target(
            name: "RThemeEngine",
            path: "Sources"
        )
    ]
)
