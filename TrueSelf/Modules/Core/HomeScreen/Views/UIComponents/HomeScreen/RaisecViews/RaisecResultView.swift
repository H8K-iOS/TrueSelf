import SwiftUI

struct RaisecResultsView: View {
    var title: String
    var color: Color
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .foregroundStyle(self.color)
                .frame(width: 14, height: 14)
            
            VStack(alignment: .leading) {
               Text(title)
                    .foregroundStyle(Color.blackPrimary)
                    .font(.system(size: 16))
                
               Text("result \(title)")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 12))
            }
            
            Spacer()
        }
    }
}
