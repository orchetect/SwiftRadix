// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "swift-radix",
    platforms: [.macOS(.v10_13), .iOS(.v11), .tvOS(.v11), .watchOS(.v4)],
    products: [
        .library(name: "SwiftRadix", targets: ["SwiftRadix"])
    ],
    targets: [
        .target(name: "SwiftRadix"),
        .testTarget(name: "SwiftRadixTests", dependencies: ["SwiftRadix"])
    ]
)
