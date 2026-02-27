// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SotoLambdaMinimalSDK",
    platforms: [ .macOS(.v15) ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SotoLambdaMinimalSDK",
            type: .static,
            targets: ["SotoLambdaMinimalSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/soto-project/soto-codegenerator", from: "7.8.1"),
        .package(url: "https://github.com/soto-project/soto-core.git", from: "7.12.0"),        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SotoLambdaMinimalSDK",
            dependencies: [.product(name: "SotoCore", package: "soto-core")],
            plugins: [.plugin(name: "SotoCodeGeneratorPlugin", package: "soto-codegenerator")]
        ),
        .executableTarget(
            name: "SotoLambdaMinimalSDKTool",
            dependencies: [
                .target(name: "SotoLambdaMinimalSDK"),
                .product(name: "SotoCore", package: "soto-core"),
            ],
        ),
        .testTarget(
            name: "SotoLambdaMinimalSDKTests",
            dependencies: ["SotoLambdaMinimalSDK"]
        ),
    ]
)
