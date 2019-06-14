// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Hubkit",
    products: [
        .library(
            name: "Hubkit",
            targets: ["Hubkit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Hubkit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "HubkitTests",
            dependencies: ["Hubkit"],
            path: "Tests"
        ),
    ]
)
