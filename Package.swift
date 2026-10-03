// swift-tools-version:5.9

import PackageDescription

// Swift Package Manager support alongside the existing podspec. The target is named after the pod's module
// (youtube_ios_player_helper) so `import youtube_ios_player_helper` keeps working for both integrations.
let package = Package(
    name: "youtube-ios-player-helper",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "youtube_ios_player_helper", targets: ["youtube_ios_player_helper"]),
    ],
    targets: [
        .target(
            name: "youtube_ios_player_helper",
            path: ".",
            exclude: [
                "Project",
                "youtube-ios-player-helper.xcodeproj",
                "youtube-ios-player-helper/Info.plist",
                "youtube-ios-player-helper/YouTubeiOSPlayerHelper.h",
                "youtube-ios-player-helper.podspec",
                "Rakefile",
                "README.md",
                "CHANGELOG.md",
                "CONTRIBUTING.md",
                "LICENSE",
            ],
            sources: ["Classes"],
            // YTPlayerView loads Assets/YTPlayerView-iframe-player.html from SWIFTPM_MODULE_BUNDLE.
            resources: [.copy("youtube-ios-player-helper/Assets.bundle/Assets")],
            publicHeadersPath: "Classes"
        ),
    ]
)
