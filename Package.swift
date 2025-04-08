// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ticketmeister",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/DiscordBM/DiscordBM", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "Ticketmeister",
            dependencies: [
                .product(name: "DiscordBM", package: "DiscordBM")
            ])
    ],
)
