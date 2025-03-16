// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "LineCountPlugin",
    products: [
        .plugin(
            name: "LineCountPlugin",
            targets: ["LineCountPlugin"]
        ),
        .library(
            name: "Dummy",
            targets: ["Dummy"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.5.0"),
    ],
    targets: [
        .target(name: "LineCounterCore"),
        .executableTarget(
            name: "LineCounter",
            dependencies: [
                "LineCounterCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "LineCounterCoreTests",
            dependencies: ["LineCounterCore"],
            resources: [.process("Resources")]
        ),
        .plugin(
            name: "LineCountPlugin",
            capability: .buildTool(),
            dependencies: ["LineCounter"]
        ),
        .target(
            name: "Dummy",
            plugins: ["LineCountPlugin"]
        ),
    ]
)
