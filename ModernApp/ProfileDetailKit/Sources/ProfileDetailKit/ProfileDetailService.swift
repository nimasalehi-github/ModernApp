import Foundation /*01*/

@MainActor
public final class ProfileDetailService: ObservableObject { /*02*/
    @Published public private(set) var profiles: [ProfileDetail] = [] /*03*/

    public init() { } /*04*/

    // MARK: - Fetch profiles
    public func loadProfiles() async { /*05*/
        print("🌐 [Service] Loading profiles...") /*06*/
        try? await Task.sleep(nanoseconds: 1_000_000_000) /*07*/
        self.profiles = [
            ProfileDetail(name: "Nima Salehi", email: "nima@example.com"),
            ProfileDetail(name: "Sara Rahimi", email: "sara@example.com")
        ] /*08*/
        print("✅ [Service] Profiles loaded: \(profiles.map { $0.name })") /*09*/
    }

    // MARK: - Update a profile
    public func updateProfile(_ profile: ProfileDetail) async { /*10*/
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) { /*11*/
            profiles[index] = profile /*12*/
            print("✏️ [Service] Profile updated: \(profile.name)") /*13*/
        }
    }

    // MARK: - Add a profile
    public func addProfile(name: String, email: String) async { /*14*/
        let newProfile = ProfileDetail(name: name, email: email) /*15*/
        profiles.append(newProfile) /*16*/
        print("➕ [Service] Profile added: \(name)") /*17*/
    }

    // MARK: - Delete a profile
    public func deleteProfile(_ profile: ProfileDetail) async { /*18*/
        profiles.removeAll { $0.id == profile.id } /*19*/
        print("🗑 [Service] Profile deleted: \(profile.name)") /*20*/
    }
}
