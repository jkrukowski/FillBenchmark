// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FillBenchmark",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .executable(name: "fill-benchmark", targets: ["FillBenchmarkCLI"]),
        .library(name: "FillBenchmark", targets: ["FillBenchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "FillBenchmarkCLI",
            dependencies: [
                "FillBenchmarkSuite",
                .product(name: "Benchmark", package: "swift-benchmark"),
            ]
        ),
        .target(
            name: "FillBenchmarkSuite",
            dependencies: [
                "FillBenchmark",
                .product(name: "Benchmark", package: "swift-benchmark"),
            ]
        ),
        .target(
            name: "FillBenchmark"
        ),
        .testTarget(
            name: "FillBenchmarkTests",
            dependencies: ["FillBenchmark"]
        ),
    ]
)
