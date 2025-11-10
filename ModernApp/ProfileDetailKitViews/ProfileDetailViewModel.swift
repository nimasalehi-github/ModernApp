import Foundation
import ProfileDetailKit

@MainActor
public final class ProfileDetailViewModel: ObservableObject { /*01*/
    @Published public private(set) var profiles: [ProfileDetail] = [] /*02*/
    @Published public var isLoading = false /*03*/

    private let service = ProfileDetailService() /*04*/

    public init() {} /*05*/

    // Load profiles from service
    public func load() async { /*06*/
        isLoading = true /*07*/
        await service.loadProfiles() /*08*/
        profiles = service.profiles /*09*/
        isLoading = false /*10*/
    }

    // Add a new profile
    public func add(name: String, email: String) async { /*11*/
        let newProfile = ProfileDetail(name: name, email: email) /*12*/
        profiles.append(newProfile) /*13*/
        print("➕ [ViewModel] Added profile: \(newProfile.name)") /*14*/
    }

    // Delete a profile
    public func delete(_ profile: ProfileDetail) async { /*15*/
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) { /*16*/
            profiles.remove(at: index) /*17*/
            print("🗑 [ViewModel] Deleted profile: \(profile.name)") /*18*/
        }
    }

    // Update an existing profile
    public func update(_ profile: ProfileDetail) async { /*19*/
        await service.updateProfile(profile) /*20*/
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) { /*21*/
            profiles[index] = profile /*22*/
        }
    }
}
