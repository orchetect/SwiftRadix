// swift-tools-version:5.3

import PackageDescription

let package = Package(
	
	name: "SwiftRadix",
	
	platforms: [.macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)],
	
	products: [
		
		.library(
			name: "SwiftRadix",
			targets: ["SwiftRadix"])
		
	],
	
	dependencies: [
		
		// none
		
	],
	
	targets: [
		
		.target(
			name: "SwiftRadix",
			dependencies: []),
		
		.testTarget(
			name: "SwiftRadixTests",
			dependencies: ["SwiftRadix"])
		
	]
	
)
