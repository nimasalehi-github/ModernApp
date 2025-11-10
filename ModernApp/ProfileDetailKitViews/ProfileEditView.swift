import SwiftUI
import Foundation
import Combine

import ProfileDetailKit
public struct ProfileEditView: View { /*01*/
    @State private var profile: ProfileDetail /*02*/
    var onSave: (ProfileDetail) -> Void /*03*/

    public init(profile: ProfileDetail, onSave: @escaping (ProfileDetail) -> Void) { /*04*/
        self._profile = State(initialValue: profile) /*05*/
        self.onSave = onSave /*06*/
    }

    public var body: some View { /*07*/
        NavigationStack {
            Form {
                TextField("Name", text: $profile.name) /*08*/
                TextField("Email", text: $profile.email) /*09*/
            }
            .navigationTitle("Edit Profile") /*10*/
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { onSave(profile) } /*11*/
                }
            }
        }
    }
}
