// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SotoLambdaMinimalSDK",
    platforms: [ .macOS(.v15) ],
    products: [
        .library(
            name: "SotoLambdaMinimalSDK",
            targets: ["SotoLambdaMinimalSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/soto-project/soto-codegenerator", from: "7.8.1"),
        .package(url: "https://github.com/soto-project/soto-core.git", from: "7.12.0"),        
    ],
    targets: [
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
