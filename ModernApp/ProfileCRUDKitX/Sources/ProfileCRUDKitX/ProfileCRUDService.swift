//
//  ProfileCRUDService.swift
//

import Foundation

@MainActor
public final class ProfileCRUDService: ObservableObject {

    @Published public private(set) var profiles: [ProfileX] = []

    public init() {
        ABLogger.log(event: "Service Initialized", output: ["profilesCount": profiles.count])
    }

    public func loadProfiles() async {
        ABLogger.log(event: "loadProfiles() started")

        try? await Task.sleep(nanoseconds: 300_000_000)

        self.profiles = [
            ProfileX(name: "Nima Salehi", email: "nima@example.com"),
            ProfileX(name: "Sara Rahimi", email: "sara@example.com")
        ]

        ABLogger.log(
            event: "loadProfiles() finished",
            output: profiles
        )
    }

    public func addProfile(_ profile: ProfileX) async {
        ABLogger.log(event: "addProfile()", input: profile)

        profiles.append(profile)

        ABLogger.log(event: "addProfile() done", output: profiles)
    }

    public func updateProfile(_ profile: ProfileX) async {
        ABLogger.log(event: "updateProfile()", input: profile)

        if let idx = profiles.firstIndex(where: { $0.id == profile.id }) {
            profiles[idx] = profile
        }

        ABLogger.log(event: "updateProfile() done", output: profiles)
    }

    public func deleteProfiles(at offsets: IndexSet) async {
        ABLogger.log(event: "deleteProfiles()", input: Array(offsets))

        profiles.remove(atOffsets: offsets)

        ABLogger.log(event: "deleteProfiles() done", output: profiles)
    }
}
