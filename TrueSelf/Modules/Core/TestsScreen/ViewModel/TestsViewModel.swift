import Foundation

@Observable
final class TestsViewModel {
    var quizzes: [QuizDescriptor] = []
    
    private let jsonService = JsonDecoderService.shared
    
    init() {
 
    }
    
    
    func getDescriptor() {
        do {
            self.quizzes = try jsonService.decodeDescriptor()
            self.quizzes.sort(by: {$0.order < $1.order })
            self.quizzes = quizzes.filter( {$0.isAvailable} )
        } catch {
            print("error getDescriptor")
            self.quizzes = []
            
        }
    }
}
