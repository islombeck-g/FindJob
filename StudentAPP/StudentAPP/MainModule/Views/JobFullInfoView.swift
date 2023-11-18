import SwiftUI

struct JobFullInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: MainModuleViewModel
    let vc: Job
    @State var isFavorite: Bool
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        
                        Button {
                            self.dismiss()
                            
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                            
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        Text("Вакансия")
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.spring) {
                                self.toggleFavorite()
                            }
                        }label: {
                            Image(systemName: self.isFavorite == true ?  "star.fill" : "star")
                                .rotationEffect(.degrees(90))
                                .frame(width: 20, height: 30)
                                .padding(4)
                                .padding(.trailing, 13)
                        }
                    }
                    .font(.system(size: 18))
                    .foregroundStyle(Color("SecondaryColor"))
                    
                    ScrollView {
                        FullInfoView(vc: vc)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                            .frame(height: 25)
                        Button{
                            self.dismiss()
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
            
            .navigationBarBackButtonHidden(true)
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    private func toggleFavorite() {
        
        isFavorite.toggle()
        
        if isFavorite {
            self.viewModel.addToFavourite(job: vc)
        } else {
            self.viewModel.removeFromFavourite(job: vc)
            
        }
    }
}

#Preview {
    JobFullInfoView(vc: Job(
        activity: "Юриспрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2), isFavorite: true)
    .environmentObject(MainModuleViewModel())
}
