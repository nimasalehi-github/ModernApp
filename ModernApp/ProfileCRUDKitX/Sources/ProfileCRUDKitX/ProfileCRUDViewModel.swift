//
//  ProfileCRUDViewModel.swift
//

import Foundation

@MainActor
public final class ProfileCRUDViewModel: ObservableObject {

    @Published public private(set) var profiles: [ProfileX] = []
    @Published public var isLoading: Bool = false

    private let service = ProfileCRUDService()

    public init() {
        ABLogger.log(event: "ViewModel Initialized")
    }

    public func load() async {
        ABLogger.log(event: "load() started")

        isLoading = true
        await service.loadProfiles()
        profiles = service.profiles
        isLoading = false

        ABLogger.log(event: "load() finished", output: profiles)
    }

    public func add(name: String, email: String) async {
        let p = ProfileX(name: name, email: email)

        ABLogger.log(event: "add()", input: p)

        await service.addProfile(p)
        profiles = service.profiles

        ABLogger.log(event: "add() done", output: profiles)
    }

    public func update(_ profile: ProfileX) async {
        ABLogger.log(event: "update()", input: profile)

        await service.updateProfile(profile)
        profiles = service.profiles

        ABLogger.log(event: "update() done", output: profiles)
    }

    public func delete(at offsets: IndexSet) async {
        ABLogger.log(event: "delete()", input: Array(offsets))

        await service.deleteProfiles(at: offsets)
        profiles = service.profiles

        ABLogger.log(event: "delete() done", output: profiles)
    }
}
