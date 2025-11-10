//
//  ProfileCRUDKitView.swift
//  ModernApp
//
//  Created by Nima Salehi on 11/10/25.
//

import SwiftUI
import Combine
import ProfileCRUDKit
struct ProfileCRUDKitView: View {
    @StateObject private var service = ProfileService()
        
        var body: some View {
            NavigationStack {
                List {
                    ForEach(service.profiles) { profile in
                        VStack(alignment: .leading) {
                            Text(profile.name).font(.headline)
                            Text(profile.email).font(.subheadline)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.map { service.profiles[$0] }.forEach(service.deleteProfile)
                    }
                }
                .navigationTitle("Profiles")
                .toolbar {
                    Button(action: {
                        _ = service.addProfile(name: "New User", email: "new@example.com")
                    }) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
}

struct ProfileCRUDKitView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCRUDKitView()
    }
}
