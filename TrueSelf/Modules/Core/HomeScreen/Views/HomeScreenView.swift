import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    private let vm: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.vm = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ///Struct
                ///Header
                ///user activity
                ///Raisec profile chart
                ///Raisec statistic
                ///progress overview
                ///avaible tests
                ///soday suggest
                
                
                ///Background
                Color.backgroundColor.ignoresSafeArea()
                ///Main View
                ScrollView {
                    
                }
                .navigationTitle(self.vm.homeTitle)
                .navigationSubtitle(self.vm.subtitle)
                .toolbar {
                    Image(systemName: "bell")
                }
            }
        }
    }
    //MARK: - Methods UI
    
    //MARK: - Methods Other
}

#Preview {
    AppTabBar()
}
