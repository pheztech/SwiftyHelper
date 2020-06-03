// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyHelper",
	platforms: [
		.iOS(.v12)
	],
    products: [
        .library(name: "SwiftyHelper", targets: [ "SwiftyHelper" ]),
    ],
    targets: [
        .target(name: "SwiftyHelper", dependencies: []),
//        .testTarget(name: "SwiftyHelperTests", dependencies: ["SwiftyHelper"]),
    ]
)
