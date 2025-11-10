import SwiftUI
import ProfileDetailKit

public struct ProfileDetailView: View { /*01*/
    @StateObject private var viewModel = ProfileDetailViewModel() /*02*/
    @State private var editingProfile: ProfileDetail? = nil /*03*/

    public init() {} /*04*/

    public var body: some View { /*05*/
        NavigationStack {
            List {
                ForEach(viewModel.profiles) { profile in /*06*/
                    Button { editingProfile = profile } label: { /*07*/
                        VStack(alignment: .leading) {
                            Text(profile.name).font(.headline)
                            Text(profile.email).font(.subheadline)
                        }
                    }
                }
                .onDelete { indexSet in /*08*/
                    Task {
                        for index in indexSet {
                            let profile = viewModel.profiles[index]
                            await viewModel.delete(profile)
                        }
                    }
                }
            }
            .navigationTitle("Profiles") /*09*/
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { await viewModel.add(name: "New User", email: "new@example.com") }
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .overlay {
                if viewModel.isLoading { ProgressView("Loading...") }
            }
            .task { await viewModel.load() } /*10*/
            .sheet(item: $editingProfile) { profile in /*11*/
                ProfileEditView(profile: profile) { updated in /*12*/
                    Task { await viewModel.update(updated) }
                }
            }
        }
    }
}
struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
