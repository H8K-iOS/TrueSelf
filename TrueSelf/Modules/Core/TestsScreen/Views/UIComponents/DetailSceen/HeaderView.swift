import SwiftUI

struct HeaderView: View {
    let descriptor: QuizDescriptor
    var body: some View {
        HStack(spacing: 22) {
            
            Circle()
                .foregroundStyle(Color.agreeableness.opacity(0.5))
                .frame(width: 64)
                .padding(.bottom, 44)
                .blinkAnimation()
            
            ZStack {
                Color.randomThreeColorGradient
                
                Image(systemName: descriptor.imageSystemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.white)
                
            }
            .frame(width: 110, height: 110)
            .clipShape(RoundedRectangle(cornerRadius: 28))
            .rotationEffect(Angle(degrees: 6))
            
            Circle()
                .foregroundStyle(Color.openness.opacity(0.5))
                .frame(width: 48)
                .blinkAnimation()
            
        }
        .padding(.vertical)
    }
}
