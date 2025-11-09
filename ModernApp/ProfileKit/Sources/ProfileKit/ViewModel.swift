import Foundation
import Combine

@MainActor
public final class ModernAppViewModel: ObservableObject { /*01*/
    @Published public private(set) var profiles: [ModernAppProfile] = [] /*02*/
    @Published public var isLoading = false /*03*/

    private let repository = ModernAppRepository() /*04*/

    public init() {} /*05*/

    public func load() async { /*06*/
        print("🧩 [ViewModel] Loading profiles...") /*07*/
        isLoading = true /*08*/
        profiles = await repository.loadProfiles() /*09*/
        isLoading = false /*10*/
        print("✅ [ViewModel] Profiles loaded: \(profiles.map { $0.name })") /*11*/
    }
}

/*
Snapshot execution:
Step 1: profiles = [], isLoading = false
Step 2: isLoading = true
Step 3: NetworkManager fetches data
Step 4: profiles updated
Step 5: isLoading = false, list displays profiles
*/
