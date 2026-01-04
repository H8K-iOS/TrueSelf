import SwiftUI

struct ProgressOverviewResultView: View {
    var width: CGFloat
    var title: String
    var userScore: Int
    var totalScore: Int
    var color: Color
    var body: some View {
        let multiplier = width
        let percent = Double(userScore) / Double(totalScore)
        
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                
                Spacer()
                
                Text("\(self.userScore) / \(self.totalScore)")
            }
            
            ZStack(alignment: .leading) {
                Capsule(style: .circular)
                    .foregroundStyle(Color.backgroundColor)
                    .frame(width: self.width)
                
                Capsule(style: .circular)
                    .foregroundStyle(self.color.gradient)
                    .frame(width: (percent * multiplier))
            }
        }
    }
}
