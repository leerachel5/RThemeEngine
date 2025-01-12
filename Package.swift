// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RThemeEngine",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "RThemeEngine",
            targets: ["RThemeEngine"]
        ),
    ],
    targets: [
        .target(
            name: "RThemeEngine",
            path: "Sources",
            resources: [.process("Resources")]
        )
    ]
)
