import Foundation

struct QuizDescriptorResponse: Decodable {
    let quizzes: [QuizDescriptor]
}

struct QuizDescriptor: Identifiable, Decodable {
    let id: String
    let definitionId: String
    let type: QuizType

    let imageSystemName: String
    let titleKey: String
    let descriptionKey: String

    let estimatedDurationMin: Int
    let questionsCount: Int

    let isAvailable: Bool
    let order: Int
}


enum QuizType: String, Decodable {
    case personality = "Personality"
    case career = "Career"
    case motivation = "Motivation"
    case cognitive = "Cognitive"
    case emotional = "Emotional"
    case social = "Social"
    case mixed = "Mixed"
}


extension QuizDescriptor {
    var title: String {
        NSLocalizedString(titleKey, tableName: "TestDescriptor_localizable", comment: "")
    }
    
    var description: String {
        NSLocalizedString(descriptionKey, tableName: "TestDescriptor_localizable", comment: "")
    }
}
