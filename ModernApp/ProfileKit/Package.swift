// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ProfileKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ProfileKit", targets: ["ProfileKit"])
    ],
    targets: [
        .target(name: "ProfileKit", path: "Sources/ProfileKit"),
        .testTarget(name: "ProfileKitTests", dependencies: ["ProfileKit"])
    ]
)
