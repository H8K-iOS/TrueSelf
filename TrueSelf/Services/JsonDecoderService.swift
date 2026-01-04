import Foundation

final class JsonDecoderService {
    static let shared = JsonDecoderService()
    private init() {}
    
    
    func decodeDescriptor() throws -> [QuizDescriptor] {
        guard let url = Bundle.main.url(forResource: "QuizDescriptor", withExtension: "json") else {
            throw NSError(domain: "File not found", code: 0)
        }
        
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(QuizDescriptorResponse.self, from: data)
        return response.quizzes
    }
}
