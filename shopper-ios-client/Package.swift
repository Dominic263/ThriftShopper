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
        .library(name: "HTTP", targets: ["HTTP"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "Shopping", targets: ["Shopping"]),
        .library(name: "Calendar", targets: ["Calendar"]),
        .library(name: "Settings", targets: ["Settings"]),
        .library(name: "GroceryItem", targets: ["GroceryItem"]),
        .library(name: "CustomViews", targets: ["CustomViews"])
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-tagged.git", branch: "main")
        
    ],
    targets: [
        
        .target(
            name: "App",
            dependencies: [
                "Shopping",
                "Settings",
                "Calendar",
                "Auth",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .target(
            name: "CustomViews",
            dependencies: []
        ),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
        
        .target(
            name: "Calendar",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .target(
            name: "GroceryItem",
            dependencies: [
                "Models",
                "CustomViews",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .target(
            name: "Settings",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
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
        ),
        .target(
            name: "Shopping",
            dependencies: [
                "Models",
                "GroceryItem",
                "CustomViews",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Tagged", package: "swift-tagged")
            ]),
        .target(
            name: "Models",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Tagged", package: "swift-tagged")
            ]),
    ]
)
