import Foundation /*01*/

public struct ProfileDetail: Identifiable, Codable { /*02*/
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
English: Data model for a single user profile, unique for ProfileDetailKit.
فارسی: مدل داده برای یک پروفایل کاربری، مخصوص پکیج ProfileDetailKit.
*/
