import SwiftUI
//Raisec todo: -
struct RaisecView: View {
    private var columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private let mockResult = RaisecResultModel.mockView()

    
    var body: some View {
        
        VStack {
            //chart
            //todo without overlay
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.cardColor)
                .frame(height: 400)
                .padding(.horizontal)
                .overlay {
                    Rectangle()
                        .frame(width: 200, height: 200)
                }
            //raisec results
            VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(mockResult) { result in
                        
                        RaisecResultsView(title: result.title, color: result.color)
                        
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.cardColor)
            )
            .padding()
        }
    }
    
}
