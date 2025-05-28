// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDBSnapshotTesting",
    platforms: [
      .iOS(.v17),
      .macOS(.v14),
      .tvOS(.v17)
    ],
    products: [
        .library(
            name: "GRDBSnapshotTesting",
            targets: ["GRDBSnapshotTesting"]),
    ],
    dependencies: [
        .package(url: "https://github.com/life-in-flow/GRDB.swift", exact: "7.4.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .upToNextMajor(from: "1.18.1")),
    ],
    targets: [
        .target(
            name: "GRDBSnapshotTesting",
            dependencies: [
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            path: "GRDBSnapshotTesting/Sources"
        ),
        .testTarget(
            name: "GRDBSnapshotTestingTests",
            dependencies: ["GRDBSnapshotTesting"],
            path: "GRDBSnapshotTestingTests",
            resources: [.process("__Snapshots__")]
        )
    ]
)
