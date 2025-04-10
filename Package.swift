// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ticketmeister",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/DiscordBM/DiscordBM", from: "1.0.0"),
        .package(url: "https://github.com/vapor/sql-kit.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/sqlite-kit.git", from: "4.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Ticketmeister",
            dependencies: [
                .product(name: "DiscordBM", package: "DiscordBM"),
                .product(name: "SQLKit", package: "sql-kit"),
                .product(name: "SQLiteKit", package: "sqlite-kit"),
            ])
    ],
)
