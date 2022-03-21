// swift-tools-version:5.5
import PackageDescription
let package = Package(
    name: "ZendeskChatSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskChatSDK",
            targets: [
                "ZendeskChatSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskChatProvidersSDK",
                 url: "https://github.com/RBNA/chat_providers_sdk_ios",
                 branch: "master"),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/RBNA/messaging_sdk_ios",
                 branch: "master")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskChatSDK",
            path: "ZendeskChatSDK.xcframework"
        ),
        .target(name: "ZendeskChatSDKTargets",
                dependencies: [
                    .target(name: "ZendeskChatSDK"),
                    .product(name: "ZendeskChatProvidersSDK", package: "ZendeskChatProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
