//
//  ProfileCRUDViewModel.swift
//  توضیح: ViewModel یک لایهٔ ساده بین View و Service است. همهٔ متدها async و MainActor هستند.
//
//  Created by Nima Salehi on 11/12/25.
//

import Foundation /*01*/

@MainActor
public final class ProfileCRUDViewModel: ObservableObject { /*02*/
    @Published public private(set) var profiles: [ProfileX] = [] /*03*/
    @Published public var isLoading: Bool = false /*04*/

    private let service = ProfileCRUDService() /*05*/

    public init() { /*06*/ }

    // Load from service
    public func load() async { /*07*/
        isLoading = true /*08*/
        await service.loadProfiles() /*09*/
        profiles = service.profiles /*10*/
        isLoading = false /*11*/
    }

    // Add
    public func add(name: String, email: String) async { /*12*/
        let p = ProfileX(name: name, email: email) /*13*/
        await service.addProfile(p) /*14*/
        profiles = service.profiles /*15*/
    }

    // Update
    public func update(_ profile: ProfileX) async { /*16*/
        await service.updateProfile(profile) /*17*/
        profiles = service.profiles /*18*/
    }

    // Delete
    public func delete(at offsets: IndexSet) async { /*19*/
        await service.deleteProfiles(at: offsets) /*20*/
        profiles = service.profiles /*21*/
    }
}
