// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BlurView",
    platforms: [
      .macOS(.v14),
      .iOS(.v17)
    ],
    products: [
        .library(
            name: "BlurView",
            targets: ["BlurView"])
    ],
    targets: [
        .target(
            name: "BlurView"),
        .testTarget(
            name: "BlurViewTests",
            dependencies: ["BlurView"])
    ]
)
