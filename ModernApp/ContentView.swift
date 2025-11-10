import SwiftUI
import ProfileKit /*01*/
import Combine

struct ContentView: View { /*02*/
    @StateObject private var viewModel = ModernAppViewModel() /*03*/

    var body: some View { /*04*/
        NavigationView {
            List(viewModel.profiles) { profile in /*05*/
                VStack(alignment: .leading) {
                    Text(profile.name) /*06*/.font(.headline)
                    Text(profile.email) /*07*/.font(.subheadline)
                }
            }
            .navigationTitle("Profiles") /*08*/
            .task { await viewModel.load() } /*09*/
            .overlay {
                if viewModel.isLoading { /*10*/
                    ProgressView("Loading...") /*11*/
                }
            }
        }
       
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
