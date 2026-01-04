import SwiftUI

struct RaisecResultModel: Identifiable {
    var id = UUID()
    var title: String
    var color: Color
    
    static func mockView() -> [RaisecResultModel] {
        return [
                    RaisecResultModel(title: "Realistic",      color: .riasecR),
                    RaisecResultModel(title: "Investigative",  color: .riasecI),
                    RaisecResultModel(title: "Artistic",       color: .riasecA),
                    RaisecResultModel(title: "Social",         color: .riasecS),
                    RaisecResultModel(title: "Enterprising",   color: .riasecE),
                    RaisecResultModel(title: "Convention",     color: .riasecC),
                ]
    }
}
