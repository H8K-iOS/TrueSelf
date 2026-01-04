import SwiftUI

struct DetailTestScreenView: View {
    let descriptor: QuizDescriptor
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.backgroundColor
                .ignoresSafeArea()
            ScrollView {
                //Main
                VStack {
                    //Header VS
                    VStack(alignment: .center, spacing: 0) {
                        //Header
                        HeaderView(descriptor: self.descriptor)
                        
                        // Title
                        TitleDetailView()
                            .padding()
                        
                        // Cards
                        InfoCardsView()
                            .padding(.vertical)
                        
                        // Detail Description
                        DetailDescriptionView()
                        
                        //Tips
                        TipsView()
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                Color.purpleGradient
                                
                                HStack {
                                    Image(systemName: "play.fill")
                                        .foregroundStyle(Color.whitePrimary)
                                    
                                    Text("Start Test Now")
                                        .foregroundStyle(Color.whitePrimary)
                                        .font(.system(size: 18, weight: .bold))
                                }
                            }
                            .frame(height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                            .padding()
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle(descriptor.type.rawValue)
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Image(systemName: "heart")
            }
            

        }
    }
    @ViewBuilder
    func TitleDetailView() -> some View {
        VStack(spacing: 14) {
            Text(descriptor.title + " " + descriptor.type.rawValue)
                .font(.system(size: 26, weight: .bold))
            
            Text("Discover Your True Self")
                .foregroundStyle(Color.randomThreeColorGradient)
                .font(.system(size: 16, weight: .bold))
        }
    }
    
    @ViewBuilder
    func InfoCard(rotationEffect: Angle,
                  color: Color,
                  title: String,
                  value: String,
                  valueOptionaltitle: String,
                  systemImage: String) -> some View {
        
        ZStack(alignment: .center) {
            Color.cardColor
            
            VStack(alignment: .center, spacing: 10) {
                ZStack(alignment: .center) {
                    color
                    
                    Image(systemName: systemImage)
                        .foregroundStyle(Color.whitePrimary)
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .frame(width: 44, height: 44)
                .rotationEffect(rotationEffect)
                
                Text(title)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.secondary)
                
                Text(value + " " + valueOptionaltitle)
                    .font(.system(size: 14, weight: .bold))
            }
            .padding(.vertical, 22)
            
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .shadow(color: color.opacity(0.4), radius: 6)
    }
    
    @ViewBuilder
    func InfoCardsView() -> some View {
        HStack(spacing: 14) {
            InfoCard(rotationEffect: Angle(degrees: -8),
                     color: .purple, title: "Duration",
                     value: String(descriptor.estimatedDurationMin),
                     valueOptionaltitle: "min", systemImage: "clock")
            
            InfoCard(rotationEffect: Angle(degrees: 8),
                     color: .pink, title: "Questions",
                     value: String(descriptor.questionsCount),
                     valueOptionaltitle: "",systemImage: "list.clipboard.fill")
            
            InfoCard(rotationEffect: Angle(degrees: -4),
                     color: .orange, title: "Type",
                     value: descriptor.type.rawValue,
                     valueOptionaltitle: "", systemImage: "lightbulb.min.badge.exclamationmark")
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func DetailDescriptionView() -> some View {
        ZStack(alignment: .topTrailing) {
            Color.cardColor.opacity(1)
            
            RoundedRectangle(cornerRadius: 33)
                .foregroundStyle(Color.cardColor)
                .frame(width: 85, height: 75)
                .offset(x: 30, y: -30)
                .shadow(color: Color.purple.opacity(0.8), radius: 4)
            
            VStack(spacing: 16) {
                
                SectionTitle(systemImage: "wand.and.sparkles.inverse", title: "What You'll Discover",
                             style: Color.randomDoubleColorGradient)
                .padding(.vertical, 8)
                
                Text("Uncover the five core dimensions of your personality: Openness, Conscientiousness, Extraversion, Agreeableness, and Neuroticism. This scientifically-backed assessment reveals unique insights about your behavior, preferences, and interpersonal style. Perfect for self-discovery, career planning, or understanding your relationships better. No right or wrong answers—just honest reflections of who you are!")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 22)
                            .foregroundStyle(Color.cardColor)
                            .shadow(color: Color.purple.opacity(0.5), radius: 2)
                    )
            }
            
            .padding()
        }
        
        .mask {
            RoundedRectangle(cornerRadius: 22)
            
        }
        .padding()
        .shadow(color: Color.purple.opacity(0.8), radius: 4)
    }
    
    @ViewBuilder
    func TipsView() -> some View{
        ZStack(alignment: .topTrailing)  {
            Color.cardColor.opacity(1)
            
            RoundedRectangle(cornerRadius: 33)
                .foregroundStyle(Color.cardColor)
                .frame(width: 85, height: 75)
                .offset(x: 30, y: -30)
                .shadow(color: Color.orange.opacity(0.8), radius: 4)
            
            VStack {
                SectionTitle(systemImage: "pencil.tip.crop.circle", title: "Tips For Best Results",
                             style: LinearGradient(colors: [.orange, .orange.opacity(0.6), .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.vertical, 8)
                
                
                VStack(alignment: .leading, spacing: 12) {
                    TipTitleView(title: "Answer honestly based on how you really are")
                    
                    TipTitleView(title: "Don't overthink—go with your first instinct")
                    
                    TipTitleView(title: "Find a comfortable, relaxed environment")
                    
                    TipTitleView(title: "No time pressure—take your time to reflect")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .foregroundStyle(Color.cardColor)
                        .shadow(color: Color.orange.opacity(0.8), radius: 2)
                )
            }
            .padding()
        }
        .mask {
            RoundedRectangle(cornerRadius: 22)
        }
        .padding()
        .shadow(color: .orange.opacity(0.8), radius: 4)
    }
    
    @ViewBuilder
    func SectionTitle(systemImage: String, title: String, style: LinearGradient) -> some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundStyle(Color.whitePrimary)
                .font(.system(size: 18))
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(style)
                )
            
            Text(title)
                .font(.system(size: 22, weight: .bold))
            
            Spacer()
        }
        
    }
    
    @ViewBuilder
    func TipTitleView(title: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.seal.fill")
                .foregroundStyle(.purple.gradient)
            
            Text(title)
                .foregroundStyle(Color.blackSecondary)
                .font(.system(size: 16, weight: .semibold))
        }
    }
}


//Detail Info

#Preview {
    NavigationStack {
        DetailTestScreenView(descriptor: QuizDescriptor(id: "riasec",
                                                        definitionId: "riasec_v1",
                                                        type: QuizType.personality/*QuizType(rawValue: "questionnaire")!*/,
                                                        imageSystemName: "brain.head.profile",
                                                        titleKey: "riasec_title",
                                                        descriptionKey: "riasec_description",
                                                        estimatedDurationMin: 10,
                                                        questionsCount: 40,
                                                        isAvailable: true,
                                                        order: 1))
    }
    
}
