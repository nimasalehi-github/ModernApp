//
//  ProfileX.swift
//  ProfileCRUDKitX
//  Model
//  Created by Nima Salehi on 11/12/25.
//

import Foundation /*01*/

public struct ProfileX: Identifiable, Codable, Hashable { /*02*/
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
EN: Model for a user profile used by ProfileCRUDKitX.
FA: مدل دادهٔ پروفایل برای پکیج ProfileCRUDKitX.
*/
