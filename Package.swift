// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
// As of 5.1, legacy XCTestManifests and allTests are not needed, as Linux can auto-discover tests

import PackageDescription

let package = Package(
    name: "SwiftRadix",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftRadix",
            targets: ["SwiftRadix"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftRadix",
            dependencies: []),
        .testTarget(
            name: "SwiftRadixTests",
            dependencies: ["SwiftRadix"]),
    ]
)
