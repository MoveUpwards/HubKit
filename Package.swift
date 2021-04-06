// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Hubkit",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "Hubkit",
            targets: ["Hubkit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/MoveUpwards/Offenbach.git", from: "2.0.0"),
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "Hubkit",
            dependencies: ["Offenbach", "RxSwift"],
            path: "Sources"
        ),
    ]
)
