import Foundation /*01*/

@MainActor
public final class ModernAppRepository: ObservableObject { /*02*/
    public init() {} /*03*/

    public func loadProfiles() async -> [ModernAppProfile] { /*04*/
        do {
            let profiles = try await ModernAppNetworkManager.shared.fetchProfiles() /*05*/
            return profiles /*06*/
        } catch {
            print("❌ [Repository] Error: \(error)") /*07*/
            return []
        }
    }
}

/*
English: Repository layer to fetch profiles.
فارسی: لایه Repository برای دریافت پروفایل‌ها
*/
