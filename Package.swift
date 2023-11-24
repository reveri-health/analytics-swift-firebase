// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SegmentFirebase",
    platforms: [
        .macOS("10.15"),
        .iOS("13.0"),
        .tvOS("11.0"),
        .watchOS("7.1")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SegmentFirebase",
            targets: ["SegmentFirebase"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            name: "Segment",
            url: "https://github.com/reveri-health/analytics-swift-flush-fix",
            revision: "56b1c1978e361f3c7c10213b3cff0096071ec6c3"
        ),
        // NOTE: The repackaging of the firebase sdk results in a mismatch in name and a duplicate firebase package dependency without the deprecated named version
        // NOTE: There may be a workaround for this to fix the identity between the app dependency and the analytics dependency but skipping research for time
            .package(
                name: "firebase-ios-sdk",
                url: "https://github.com/reveri-health/firebase-ios-sdk-xcframeworks",
                branch: "release/10.17.0"
            )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SegmentFirebase",
            dependencies: ["Segment",
                            .product(
                                name: "FirebaseAnalytics",
                                package: "firebase-ios-sdk")
                          ]
        ),
        
        // TESTS ARE HANDLED VIA THE EXAMPLE APP.
    ]
)

