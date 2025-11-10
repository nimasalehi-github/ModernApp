// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProfileCRUDKit",
//    🔍 چرا لازم است؟
//
//    ObservableObject و @Published در Combine معرفی شدن و از iOS 13 به بعد وجود دارن.
//
//    اگر platforms مشخص نشده باشه، Swift Package به‌صورت پیش‌فرض با iOS 9 سازگار در نظر گرفته میشه.
//
//    با این خط اضافه:
    platforms: [
            .iOS(.v13) // ✅ حداقل نسخه iOS 13 برای پشتیبانی از SwiftUI و Combine
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ProfileCRUDKit",
            targets: ["ProfileCRUDKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ProfileCRUDKit",
            dependencies: []),
        .testTarget(
            name: "ProfileCRUDKitTests",
            dependencies: ["ProfileCRUDKit"]),
    ]
)
