// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GlassKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "GlassKit",
            targets: ["GlassKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GlassKit",
            dependencies: [],
            path: "Sources/GlassKit"),
        .testTarget(
            name: "GlassKitTests",
            dependencies: ["GlassKit"],
            path: "Tests/GlassKitTests"),
    ]
)
