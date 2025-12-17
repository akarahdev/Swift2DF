// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift2DF",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Swift2DF",
            targets: ["Swift2DF"]
        ),
        .executable(
            name: "Swift2DFPlayground", 
            targets: ["Swift2DFPlayground"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/1024jp/GzipSwift", from: Version(6, 0, 0)),
        .package(url: "https://github.com/vapor/websocket-kit.git", from: Version(2, 16, 1))
    ],
    targets: [
        .target(
            name: "Swift2DF",
            dependencies: [
                .product(name: "Gzip", package: "GzipSwift"),
                .product(name: "WebSocketKit", package: "websocket-kit")
            ]
        ),
        .executableTarget(
            name: "Swift2DFPlayground",
            dependencies: [
                .product(name: "Gzip", package: "GzipSwift"),
                .product(name: "WebSocketKit", package: "websocket-kit"),
                .byName(name: "Swift2DF")
            ]
        )
    ]
)
