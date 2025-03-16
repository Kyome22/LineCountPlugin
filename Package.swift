// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "LineCountPlugin",
    products: [
        .executable(
            name: "lc",
            targets: ["LineCounter"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.5.0")
    ],
    targets: [
        .target(name: "LineCounterCore"),
        .executableTarget(
            name: "LineCounter",
            dependencies: [
                "LineCounterCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "LineCounterCoreTests",
            dependencies: ["LineCounterCore"],
            resources: [.process("Resources")]
        )
    ]
)
