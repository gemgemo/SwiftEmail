// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Email",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "Email",
            type: .dynamic,
            targets: ["Email"]
        ),
    ],
    targets: [
        .target(
            name: "Email",
            path: "Sources"
        ),
        .testTarget(
            name: "EmailTests",
            dependencies: ["Email"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
