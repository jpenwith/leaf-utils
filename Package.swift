// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "leaf-utils",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LeafUtils",
            targets: ["LeafUtils"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/leaf.git", from: "4.2.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LeafUtils",
            dependencies: [
                .product(name: "Leaf", package: "leaf"),
            ]
        ),
        .testTarget(
            name: "LeafUtilsTests",
            dependencies: ["LeafUtils"]
        ),
    ]
)
