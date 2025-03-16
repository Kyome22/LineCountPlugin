// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "LineCounter",
    products: [
        .executable(
            name: "lc",
            targets: ["LineCounter"]
        )
    ],
    targets: [
        .executableTarget(name: "LineCounter")
    ]
)
