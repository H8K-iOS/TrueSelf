import SwiftUI

//Progresss Overview TODO
struct ProgressOverviewView: View {
    var width: CGFloat
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading) {
                    Text("Overall Completion")
                        .foregroundStyle(.secondary)
                        .font(.system(size: 16))
                    
                    
                    Text("85 %")
                        .foregroundStyle(Color.blackPrimary)
                        .font(.system(size: 24, weight: .bold))
                    
                }
                
                Spacer()
                
                Circle()
                    .frame(width: 65, height: 65)
            }
            .padding()
            
            VStack {
                ProgressOverviewResultView(width: width,
                                           title: "Personality Test",
                                           userScore: 8, totalScore: 10,
                                           color: Color.cognitionAttention)
                
                ProgressOverviewResultView(width: width, title: "Personality Test",
                                           userScore: 6, totalScore: 8,
                                           color: Color.cognitionMemory)
                
                ProgressOverviewResultView(width: width, title: "Personality Test",
                                           userScore: 5, totalScore: 6,
                                           color: Color.cognitionReaction)
            }
            .padding()
        }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.cardColor)
            )
            .padding()
        }
    
}
