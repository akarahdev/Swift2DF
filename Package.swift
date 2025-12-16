// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift2df",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "swift2df",
            targets: ["swift2df"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/1024jp/GzipSwift", from: Version(6, 0, 0)),
        .package(url: "https://github.com/vapor/websocket-kit.git", from: Version(2, 16, 1))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "swift2df",
            dependencies: [
                .product(name: "Gzip", package: "GzipSwift"),
                .product(name: "WebSocketKit", package: "websocket-kit")
            ]
        ),
        .testTarget(
            name: "swift2dfTests",
            dependencies: ["swift2df"]
        ),
    ]
)
