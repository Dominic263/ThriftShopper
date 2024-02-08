// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "shopper-ios-client",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "Auth", targets: ["Auth"]),
        .library(name: "App", targets: ["App"]),
        .library(name: "HTTP", targets: ["HTTP"])
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.5.0")
    ],
    targets: [
        
        .target(
            name: "App",
            dependencies: [
                "Auth",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
        
        .target(
            name: "Auth",
            dependencies: [
                "HTTP",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "AuthTests",
            dependencies: ["Auth"]),
        
        .target(
            name: "HTTP",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)
