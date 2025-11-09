import Foundation /*01*/

public actor ModernAppNetworkManager { /*02*/
    public static let shared = ModernAppNetworkManager() /*03*/

    public func fetchProfiles() async throws -> [ModernAppProfile] { /*04*/
        print("🌐 [NetworkManager] Fetching profiles...") /*05*/
        try await Task.sleep(nanoseconds: 1_000_000_000) /*06*/
        let profiles = [
            ModernAppProfile(name: "Nima Salehi", email: "nima@example.com"),
            ModernAppProfile(name: "Sara Rahimi", email: "sara@example.com")
        ] /*07*/
        print("✅ [NetworkManager] Profiles fetched: \(profiles.map { $0.name })") /*08*/
        return profiles
    }
}

/*
English: Simulates fetching profiles from network with 1-second delay.
فارسی: شبیه‌سازی دریافت پروفایل‌ها از شبکه با تاخیر ۱ ثانیه
*/
