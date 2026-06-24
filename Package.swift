//
// Copyright (c) 2026 Coderkube Technologies - AuthFLowKit. All rights reserved.
//

// swift-tools-version: 6.2
import PackageDescription

let package = Package(
  name: "AuthFlowKit",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v15),
    .macOS(.v12)
  ],
  products: [
    .library(
      name: "AuthFlowKit",
      targets: ["AuthFlowKit"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "AuthFlowKit",
      dependencies: []
    ),
    .testTarget(
      name: "AuthFlowKitTests",
      dependencies: ["AuthFlowKit"]
    )
  ]
)
