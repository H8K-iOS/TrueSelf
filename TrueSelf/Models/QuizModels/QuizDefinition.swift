import Foundation

struct QuizDefinition {
    let id: String
    let version: Int
    let type: QuizType
    let questions: [QuizQuestion]
    let answerFormat: QuizAnswerFormat
}

struct QuizQuestion: Identifiable {
    let id: String
    let textKey: String
    let dimension: String? //  R / I / A / O / C / E
}

enum QuizAnswerFormat {
    case likert(scale: LikertScale)
    case singleChoice(options: [String])
    case forcedChoice
}

struct LikertScale {
    let min: Int
    let max: Int
    let scaleLey: String
}
