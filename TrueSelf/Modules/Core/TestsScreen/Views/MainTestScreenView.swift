import SwiftUI

struct MainTestScreenView: View {
    private var column: [GridItem] = [GridItem(.flexible())]
    @State private var vm = TestsViewModel()
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        //Info screen
                        VStack {
                            Image(systemName: "list.bullet.clipboard.fill")
                            
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 34, height: 34)
                                .foregroundStyle(Color.whitePrimary)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 22)
                                        .fill(Color.glassWhite)
                                )
                            
                            VStack(spacing: 14) {
                                Text("Select Assessment")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundStyle(Color.whitePrimary)
                                
                                VStack(alignment: .center) {
                                    Text("Choose a test below to discover more about your interests, personality, motivation, or cognitive abilities.")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(Color.backgroundColor)
                                    
                                }
                            }
                            .padding()
                        }
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 26)
                                .fill(Color.purpleGradient)
                        )
                        
                        
                        // tests select
                        LazyVGrid(columns: self.column) {
                            ForEach(vm.quizzes) { descriptor in
                                NavigationLink {
                                    DetailTestScreenView(descriptor: descriptor)
                                } label: {
                                    TestCellView(descriptor: descriptor)
                                        .foregroundStyle(Color.blackPrimary)
                                }
                            }
                        }
                    }
                    
                    
                    // tip
                    // Spacer()
                    
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Choose Your Test")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.backgroundColor.opacity(0.8), for: .navigationBar)
            .toolbar {
                Image(systemName: "questionmark")
            }
            .task {
                self.vm.getDescriptor()
            }
            
        }
    }
}

#Preview {
    MainTestScreenView()
}


//Cell

struct TestCellView: View {
    let descriptor: QuizDescriptor
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: descriptor.imageSystemName)
                
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 33, height: 33)
                .foregroundStyle(Color.whitePrimary)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.blue.gradient)
                )
                .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(descriptor.title)
                    .font(.system(size: 20, weight: .bold))
                
                VStack(alignment: .center) {
                    Text(descriptor.description)
                        .foregroundStyle(Color.blackSecondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                
                HStack {
                    HStack(spacing: 2) {
                        Image(systemName: "clock")
                        Text("\(descriptor.estimatedDurationMin) min")
                    }
                    
                    HStack(spacing: 2) {
                        Image(systemName: "text.document")
                        Text("\(descriptor.questionsCount) questions")
                    }
                }
                .font(.system(size: 14))
                .foregroundStyle(Color.blackTertiary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                
        }
        .padding()
        .padding(.bottom, 22)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.cardColor.opacity(0.9))
        )
        .shadow(radius: 6)
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}
