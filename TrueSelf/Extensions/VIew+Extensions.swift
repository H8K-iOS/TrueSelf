import SwiftUI

extension View {
    
    
    func blinkAnimation() -> some View {
        modifier(Blinkmodifier(duration: 2))
    }
}

struct Blinkmodifier: ViewModifier {
    let duration: Double
    @State var isVisible: Bool = true
    
    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 0.6 : 0.2)
            .onAppear {
                withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
                    isVisible.toggle()
                }
            }
    }
    
}
