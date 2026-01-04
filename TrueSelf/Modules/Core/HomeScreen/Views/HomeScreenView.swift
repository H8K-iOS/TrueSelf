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
                GeometryReader { geo in
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
                        VStack {
                                //todo
                            ProfileSummaryView(userName: "Sarah M",
                                               profileID: "77",
                                               completedTestsPercentage: 45,
                                               numberOdCompletedTest: 7,
                                               whenUpdated: "Today")
                            
                            
                            ///Raisec chart
                            SectionHeader(title: "RAISEC Profile", isDetailed: true)
                            RaisecView()
                            
                            
                            SectionHeader(title: "Progress Overview", isDetailed: false)
                            ProgressOverviewView(width: geo.size.width * 0.8)
                        }
                    }
                    .scrollIndicators(.hidden)
                    .navigationTitle(self.vm.homeTitle)
                    .navigationSubtitle(self.vm.subtitle)
                    .toolbarBackground(Color.backgroundColor.opacity(0.6), for: .navigationBar)
                    .toolbar {
                        Image(systemName: "bell")
                    }
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

//MARK: - Extensions
private extension HomeScreenView {
    struct SectionHeader: View {
        var title: String
        var isDetailed: Bool
        var body: some View {
            
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                if !isDetailed {
                    Spacer()
                } else {
                    Spacer()
                    
                    Button {
                        print("TO details")
                    } label: {
                        HStack(spacing: 4) {
                            Text("Details")
                                .foregroundStyle(Color.accentPrimary)
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 15))
                                .padding(.top, 1)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    
    
}
