//
//  ProfileEditView.swift
//  
//
//  Created by Nima Salehi on 11/12/25.
//

import SwiftUI /*01*/

public struct ProfileEditView: View { /*02*/
    @State private var profile: ProfileX /*03*/
    var onSave: (ProfileX) -> Void /*04*/

    public init(profile: ProfileX, onSave: @escaping (ProfileX) -> Void) { /*05*/
        self._profile = State(initialValue: profile) /*06*/
        self.onSave = onSave /*07*/
    }

    public var body: some View { /*08*/
        NavigationStack {
            Form {
                Section(header: Text("Info")) {
                    TextField("Name", text: $profile.name) /*09*/
                    TextField("Email", text: $profile.email) /*10*/
                        .keyboardType(.emailAddress)
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        //نکته: onSave یک closure سینک است (UI thread). از ViewModel متد async فراخوانی کنید تا عملیات شبکه/سرویس انجام شود.
                        onSave(profile) /*11*/ 
                    }
                }
            }
        }
    }
}

/* Preview */
struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(profile: ProfileX(name: "Preview", email: "preview@example.com")) { updated in
            print("Saved preview: \(updated)")
        }
    }
}


