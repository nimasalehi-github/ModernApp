//
//  ProfileService.swift
//  A: Mock CRUD Implementation
//
import Combine
import Foundation

/// Service for managing profiles entirely in memory.
/** English:
    Provides add, update, delete, and fetch operations using in-memory storage.
    فارسی:
    عملیات افزودن، ویرایش، حذف و واکشی پروفایل‌ها را در حافظه انجام می‌دهد.
*/
public final class ProfileService: ObservableObject {
    @Published public private(set) var profiles: [Profile] = []
    
    public init() {
        loadMockData()
    }
    
    /// Loads some sample profiles
    private func loadMockData() {
        profiles = [
            Profile(name: "Ali Karimi", email: "ali@example.com"),
            Profile(name: "Nima Salehi", email: "nima@example.com"),
            Profile(name: "Sara Rahimi", email: "sara@example.com")
        ]
    }
    
    // MARK: - CRUD
    
    /// Create
    @discardableResult
    public func addProfile(name: String, email: String) -> Profile {
        let profile = Profile(name: name, email: email)
        profiles.append(profile)
        return profile
    }
    
    /// Read
    public func getProfiles() -> [Profile] {
        profiles
    }
    
    /// Update
    public func updateProfile(_ updated: Profile) {
        if let index = profiles.firstIndex(where: { $0.id == updated.id }) {
            profiles[index] = updated
        }
    }
    
    /// Delete
    public func deleteProfile(_ profile: Profile) {
        profiles.removeAll { $0.id == profile.id }
    }
}
