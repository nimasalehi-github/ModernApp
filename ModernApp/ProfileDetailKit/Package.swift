// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ProfileDetailKit", /*01*/
    platforms: [.iOS(.v16)], /*02*/
    products: [
        .library(
            name: "ProfileDetailKit", /*03*/
            targets: ["ProfileDetailKit"] /*04*/
        )
    ],
    targets: [
        .target(
            name: "ProfileDetailKit", /*05*/
            path: "Sources/ProfileDetailKit" /*06*/
        ),
        .testTarget(
            name: "ProfileDetailKitTests", /*07*/
            dependencies: ["ProfileDetailKit"] /*08*/
        )
    ]
)
//
//توضیح bilingual:
//
///01/: نام پکیج جدید که namespace را نیز مشخص می‌کند.
//
///02/: فقط iOS 16 به بعد پشتیبانی شود.
//
///03-04/: محصول پکیج که سایر اپ‌ها می‌توانند import کنند.
//
///05-06/: مسیر سورس‌های اصلی.
//
///07-08/: مسیر و نام تست‌ها.
