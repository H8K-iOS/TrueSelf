import SwiftUI

extension Color {

    // MARK: - Base
    
    static let backgroundColor = Color(hex: "#EAEFF5")
    static let cardColor = Color(hex: "#FFFFFF")

    static let blackPrimary = Color.black
    static let blackSecondary = Color.black.opacity(0.7)
    static let blackTertiary = Color.black.opacity(0.45)

    static let whitePrimary = Color.white
}

extension Color {

    static let accentPrimary = Color(hex: "#4D96FF")
    static let accentSecondary = Color(hex: "#845EC2")

}

extension Color {

    /// Realistic
    static let riasecR = Color(hex: "#FF6B6B")

    /// Investigative
    static let riasecI = Color(hex: "#4D96FF")

    /// Artistic
    static let riasecA = Color(hex: "#845EC2")

    /// Social
    static let riasecS = Color(hex: "#00C9A7")

    /// Enterprising
    static let riasecE = Color(hex: "#FFC75F")

    /// Conventional
    static let riasecC = Color(hex: "#6A7F98")

}

//BigFive
extension Color {

    static let openness = Color(hex: "#6C63FF")
    static let conscientiousness = Color(hex: "#00BFA6")
    static let extraversion = Color(hex: "#FF9F1C")
    static let agreeableness = Color(hex: "#4D96FF")
    static let neuroticism = Color(hex: "#FF6B6B")

}

//MARK: - to inj for mini-games
extension Color {

    static let cognitionAttention = Color(hex: "#5BC0EB")
    static let cognitionMemory = Color(hex: "#9B5DE5")
    static let cognitionReaction = Color(hex: "#F15BB5")

}

//MARK: - Shadows
extension Color {

    static let shadowLight = Color.black.opacity(0.08)
    static let shadowMedium = Color.black.opacity(0.12)

    static let glassWhite = Color.white.opacity(0.25)
    static let glassDark = Color.black.opacity(0.2)

}

//MARK: - Gradients
extension Color {

    static let purpleGradientStart = Color(hex: "#6D5BFF")
    static let purpleGradientMiddle = Color(hex: "#7C5CFF")
    static let purpleGradientEnd = Color(hex: "#9B5CF6")

    static let purpleGradient = LinearGradient(
        gradient: Gradient(colors: [
            .purpleGradientStart,
            .purpleGradientMiddle,
            .purpleGradientEnd
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}


extension Color {

    init(hex: String, opacity: Double = 1) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255

        self.init(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }

}



//MARK: - Random Gradient
extension Color {
    static let randomThreeColorGradient = LinearGradient(
        colors: (0..<3).map({ _ in .randomSoftGradient()}),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let randomDoubleColorGradient = LinearGradient(
        colors: (0..<2).map({ _ in .randomSoftGradient()}),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static func randomSoftGradient() -> Color {
        Color(hue: Double.random(in: 0.6...0.9),
              saturation: 0.75,
              brightness: Double.random(in: 0.85...1)
        )
    }
}
