// swift-tools-version:5.1
// (be sure to update the .swift-version file when this Swift version changes)

import PackageDescription

let package = Package(
    name: "SwiftRadix",
    platforms: platforms,
    products: [
        .library(name: "SwiftRadix", targets: ["SwiftRadix"])
    ],
    targets: [
        .target(name: "SwiftRadix"),
        .testTarget(name: "SwiftRadixTests", dependencies: ["SwiftRadix"])
    ]
)

#if swift(>=5.7) // Swift version in Xcode 14+
let platforms: [SupportedPlatform] = [.macOS(.v10_13), .iOS(.v11), .tvOS(.v11), .watchOS(.v4)]
#else // Swift version prior to Xcode 14
let platforms: [SupportedPlatform] = [.macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)]
#endif
