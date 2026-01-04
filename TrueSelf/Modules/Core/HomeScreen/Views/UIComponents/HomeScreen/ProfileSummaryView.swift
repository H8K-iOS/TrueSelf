import SwiftUI

struct ProfileSummaryView: View {
    //todo var user: user
    var userName: String
    var profileID: String
    var completedTestsPercentage: Int
    var numberOdCompletedTest: Int
    var whenUpdated: String
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 22)
            //todo
                .foregroundStyle(Color.openness.gradient.opacity(0.1))
            
            
            VStack {
                HStack {
                    Circle()
                        .frame(width: 55, height: 55)
                    
                    VStack(alignment: .leading) {
                        Text(self.userName)
                            .foregroundStyle(Color.blackPrimary)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("Profile ID: #\(self.profileID)")
                            .foregroundStyle(Color.secondary)
                            .font(.system(size: 14, weight: .medium))
                    }
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color.cardColor)
                        .frame(width: 55, height: 40)
                        .overlay {
                            Text("\(self.completedTestsPercentage)%")
                                .foregroundStyle(Color.accentPrimary)
                                .font(.system(size: 14, weight: .bold))
                        }
                }
                .padding(.horizontal)
                
                HStack {
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(Color.cardColor)
                        .overlay(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Tests taken")
                                    .foregroundStyle(Color.secondary)
                                
                                Text("\(self.numberOdCompletedTest)")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal)
                        }
                    
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(Color.cardColor)
                        .overlay(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Last Update")
                                    .foregroundStyle(Color.secondary)
                                
                                Text("\(self.whenUpdated)")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal)
                        }
                }
                .frame(height: 90)
                .padding()
            }
            
        }
        .frame(height: 220)
        .padding()
    }
}
