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
    dependencies: [
        .package(url: "https://github.com/MoveUpwards/Offenbach.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Hubkit",
            dependencies: ["Offenbach"],
            path: "Sources"
        ),
        .testTarget(
            name: "HubkitTests",
            dependencies: ["Hubkit"],
            path: "Tests"
        ),
    ]
)
