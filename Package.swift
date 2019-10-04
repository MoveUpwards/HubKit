// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Hubkit",
    platforms: [
        .iOS(.v10),
    ],
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
    ]
)
