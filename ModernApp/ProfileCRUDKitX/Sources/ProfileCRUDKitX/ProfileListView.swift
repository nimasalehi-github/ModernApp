//
//  ProfileListView.swift
//  
//
//  Created by Nima Salehi on 11/12/25.
//

import SwiftUI /*01*/

public struct ProfileListView: View { /*02*/
    @StateObject private var vm = ProfileCRUDViewModel() /*03*/
    @State private var showingEditor = false /*04*/
    @State private var editingProfile: ProfileX? = nil /*05*/
    @State private var newName = "" /*06*/
    @State private var newEmail = "" /*07*/

    public init() {} /*08*/

    public var body: some View { /*09*/
        NavigationStack {
            List {
                ForEach(vm.profiles) { profile in /*10*/
                    Button {
                        editingProfile = profile
                        newName = profile.name
                        newEmail = profile.email
                        showingEditor = true
                    } label: {
                        VStack(alignment: .leading) {
                            Text(profile.name).font(.headline)
                            Text(profile.email).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    Task { await vm.delete(at: indexSet) }
                }
            }
            .navigationTitle("Profiles")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // prepare to add
                        editingProfile = nil
                        newName = ""
                        newEmail = ""
                        showingEditor = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .task { await vm.load() }
            .overlay {
                if vm.isLoading {
                    ProgressView("Loading...")
                }
            }
            .sheet(isPresented: $showingEditor) {
                // Editor sheet: reuse ProfileEditView for both add & edit
                if let editing = editingProfile {
                    ProfileEditView(profile: editing) { updated in
                        Task { await vm.update(updated) }
                        showingEditor = false
                    }
                } else {
                    // add flow: create a temporary ProfileX with newName/newEmail and call add
                    NavigationStack {
                        Form {
                            TextField("Name", text: $newName)
                            TextField("Email", text: $newEmail)
                                .keyboardType(.emailAddress)
                        }
                        .navigationTitle("Add Profile")
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Save") {
                                    Task {
                                        await vm.add(name: newName, email: newEmail)
                                        showingEditor = false
                                    }
                                }
                            }
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") { showingEditor = false }
                            }
                        }
                    }
                }
            }
        }
    }
}

/* Preview */
struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
    }
}



