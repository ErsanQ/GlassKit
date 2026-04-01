// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GlassKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
        .visionOS(.v1)
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
            path: "Sources/GlassKit",
            exclude: ["Examples"]),
    ]
)
