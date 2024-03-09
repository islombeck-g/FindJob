import SwiftUI

struct VacancyDetailView: View {
    
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject var presenter: VacancyBoardPresenter
//    @Environment(\.dismiss) var dismiss
    let vc:Job
    @State var isFavorite: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        VacancyScrollInfoForm(vc: vc)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                            .frame(height: 25)
                        Button{
                            
                        } label: {
                            
                            Text("Откликнутся")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Color("AccentColor"))
                                .clipShape(.rect(cornerRadius: 13))
                                .padding(.horizontal, 16)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
//                        self.dismiss()
                        self.router.navigateBack()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Вакансия")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    withAnimation(.spring) {
                        Button {
                            self.toggleFavorite()
                        }label: {
                            Image(systemName: self.isFavorite == true ?  "star.fill" : "star")
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 13)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        }
            
    }
    private func toggleFavorite() {
        
        isFavorite.toggle()
        
        if isFavorite {
            self.presenter.addToFavourite(job: vc)
        } else {
            self.presenter.removeFromFavourite(job: vc)
            
        }
    }
}

#Preview {
    VacancyDetailView(vc: Job(
        id: "3", activity: "Юриспрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2), isFavorite: true)
        .environmentObject(AppRouter.shared)
}
