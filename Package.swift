// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "Rollbar",
                      platforms: [
                        .macOS(.v10_12),
                        .iOS(.v8)//,
                         //.tvOS(.v10),
                         //.watchOS(.v3)
                        ],
                      products: [
                        .library(name: "Rollbar", targets: ["Rollbar-SPM"]),
                        .library(name: "RollbarStatic", type: .static, targets: ["Rollbar-SPM"]),
                        .library(name: "RollbarDynamic", type: .dynamic, targets: ["Rollbar-SPM"]),
                        ],
                      targets: [
                        .target(name: "KSCrash",
                                path: "KSCrash/Source",
                                exclude: ["Common-Examples", "CrashProbe", "KSCrash-Tests"],
                                publicHeadersPath: "Framework",
                                cSettings: [
                                    .headerSearchPath("KSCrash/Installations"),
                                    .headerSearchPath("KSCrash/llvm"),
                                    .headerSearchPath("KSCrash/llvm/Support"),
                                    .headerSearchPath("KSCrash/llvm/Config"),
                                    .headerSearchPath("KSCrash/llvm/ADT"),
                                    .headerSearchPath("KSCrash/Recording"),
                                    .headerSearchPath("KSCrash/Recording/Monitors"),
                                    .headerSearchPath("KSCrash/Recording/Tools"),
                                    .headerSearchPath("KSCrash/Reporting/Filters"),
                                    .headerSearchPath("KSCrash/Reporting/Filters/Tools"),
                                    .headerSearchPath("KSCrash/Reporting/Sinks"),
                                    .headerSearchPath("KSCrash/Reporting/Tools"),
                                    .headerSearchPath("KSCrash/swift"),
                                    .headerSearchPath("KSCrash/swift/Basic"),
                                    ],
                                cxxSettings: [
                                    .headerSearchPath("KSCrash/Installations"),
                                    .headerSearchPath("KSCrash/llvm"),
                                    .headerSearchPath("KSCrash/llvm/Support"),
                                    .headerSearchPath("KSCrash/llvm/Config"),
                                    .headerSearchPath("KSCrash/llvm/ADT"),
                                    .headerSearchPath("KSCrash/Recording"),
                                    .headerSearchPath("KSCrash/Recording/Monitors"),
                                    .headerSearchPath("KSCrash/Recording/Tools"),
                                    .headerSearchPath("KSCrash/Reporting/Filters"),
                                    .headerSearchPath("KSCrash/Reporting/Filters/Tools"),
                                    .headerSearchPath("KSCrash/Reporting/Sinks"),
                                    .headerSearchPath("KSCrash/Reporting/Tools"),
                                    .headerSearchPath("KSCrash/swift"),
                                    .headerSearchPath("KSCrash/swift/Basic"),
                                    ],
                                //swiftSettings: [],
                                linkerSettings: [
                                    .linkedLibrary("libz"),
                                    .linkedLibrary("libc++"),
                                ]
                        ),
                        .target(name: "Rollbar-SPM",
                                dependencies: ["KSCrash"],
                                path: ".",//"Rollbar",
                                exclude: [
                                    "build",
                                    "Dist",
                                    "Examples",
                                    "KSCrash",
                                    "RollbarKit-iOSTests",
                                    "RollbarKit-macOSTests",
                                    "RollbarTests",
                                ],
                                publicHeadersPath: "RollbarFramework",
                                cSettings: [
                                    .headerSearchPath("Rollbar"),
                                    .headerSearchPath("Rollbar/DTOs"),
                                    .headerSearchPath("Rollbar/Deploys"),
                                    .headerSearchPath("KSCrash/Source/KSCrash/Recording"),
                                    .headerSearchPath("KSCrash/Source/KSCrash/Reporting/Filters"),
                                    ]
                        ),
                      ],
                      swiftLanguageVersions: [.v5],
                      cLanguageStandard: .gnu99,
                      cxxLanguageStandard: .gnucxx11
)
