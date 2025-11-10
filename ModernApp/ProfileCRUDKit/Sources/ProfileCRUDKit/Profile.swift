//
//  Profile.swift
//  
//
//  Created by Nima Salehi on 11/10/25.
//  A: Data Model
import Foundation

/// Represents a user profile in memory.
/** English:
    Represents a simple profile object with basic information.
    فارسی:
    نمایش‌دهنده یک پروفایل ساده شامل اطلاعات پایه.
*/
public struct Profile: Identifiable, Codable, Equatable {
    public let id: UUID
    public var name: String
    public var email: String
    
    public init(id: UUID = UUID(), name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

