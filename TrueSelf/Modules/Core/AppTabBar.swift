import SwiftUI

struct AppTabBar: View {
    private let homeTab: String = "home"
    private let testsTab: String = "tests"
    private let discoverTab: String = "discover"
    private let profileTab: String = ""
    
    var body: some View  {
        TabView {
            Tab(self.homeTab.capitalized, systemImage: "house.fill") {
                HomeScreenView(viewModel: HomeViewModel())
            }
            
            
            Tab(self.testsTab.capitalized, systemImage: "clipboard.fill") {
                TestScreenView()
            }
            
            Tab(self.discoverTab.capitalized, systemImage: "globe") {
                DiscoverScreenView()
            }
            
            Tab(self.profileTab, systemImage: "brain.head.profile") {
                ProfileScreenView()
            }
        }
        .tint(.blue.opacity(0.5))
    }
}

#Preview {
    AppTabBar()
}
