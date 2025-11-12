//
//  ProfileCRUDService.swift
//  
//
//  Created by Nima Salehi on 11/12/25.
//

import Foundation /*01*/

@MainActor
public final class ProfileCRUDService: ObservableObject { /*02*/
    @Published public private(set) var profiles: [ProfileX] = [] /*03*/

    public init() { /*04*/ }

    // Simulate network / load initial data
    public func loadProfiles() async { /*05*/
        print("🌐 [Service] loading profiles...") /*06*/
        try? await Task.sleep(nanoseconds: 300_000_000) /*07*/
        self.profiles = [
            ProfileX(name: "Nima Salehi", email: "nima@example.com"),
            ProfileX(name: "Sara Rahimi", email: "sara@example.com")
        ] /*08*/
        print("✅ [Service] loaded: \(profiles.map { $0.name })") /*09*/
    }

    // Add
    public func addProfile(_ profile: ProfileX) async { /*10*/
        profiles.append(profile) /*11*/
        print("➕ [Service] added: \(profile.name)") /*12*/
    }

    // Update
    public func updateProfile(_ profile: ProfileX) async { /*13*/
        if let idx = profiles.firstIndex(where: { $0.id == profile.id }) {
            profiles[idx] = profile /*14*/
            print("✏️ [Service] updated: \(profile.name)") /*15*/
        }
    }

    // Delete by index set
    public func deleteProfiles(at offsets: IndexSet) async { /*16*/
        profiles.remove(atOffsets: offsets) /*17*/
        print("🗑 [Service] deleted at offsets: \(offsets)") /*18*/
    }
}
//توضیح: Service ایزوله‌شده با @MainActor و @Published private(set) برای انکپسولاسیون. تمام تغییرات از طریق متدها انجام می‌شوند.
