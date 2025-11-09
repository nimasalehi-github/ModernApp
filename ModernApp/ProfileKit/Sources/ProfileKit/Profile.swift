import Foundation /*01*/

public struct ModernAppProfile: Identifiable, Codable { /*02*/
    public var id: UUID /*03*/
    public var name: String /*04*/
    public var email: String /*05*/

    public init(id: UUID = UUID(), name: String, email: String) { /*06*/
        self.id = id
        self.name = name
        self.email = email
    }
}

/*
English: Data model for user profile.
فارسی: مدل داده برای پروفایل کاربر
*/
