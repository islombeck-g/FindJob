import SwiftUI

struct CvFullInfoSCREEN: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment (\.dismiss) var dismiss
    @Bindable var cv:CvData
    @Environment(\.modelContext) private var modelContest
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteCV_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        
                        ProfileImage(
                            name: self.$cv.firstName,
                            secondName: self.$cv.secondName,
                            patronymicName: self.$cv.patronymicName,
                            image: self.$viewModel.student.image,
                            phoneNumber: self.$cv.phoneNumber)
                            .padding(.vertical, 16)
                         
                        Spacer()
                            .frame(height: 25)
                        
                        CvFullInfoListView(cv: cv)
                        
                        Spacer()
                            .frame(height: 30)
                      
                        Divider()
                        
                        Spacer()
                            .frame(height: 10)
                        
                        .alert("Удалить аккаунт?", isPresented: self.$deleteCV_isAllertShow) {
                            Button{
                                
                            }label: {
                                Text("Отмена")
                            }
                                
                            Button{
                                //удалить резюме
                                self.modelContest.delete(cv)
                                self.dismiss()
                            }label: {
                                Text("Удалить")
                            }
                        } message: {
                            Text("Восстановление аккаунта невозможно после удаления.")
                        }
                    }
                    .foregroundStyle(Color("SecondaryColor"))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                
                    ToolbarItem(placement: .topBarLeading) {
                
                        Button {
                            self.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                
                    ToolbarItem(placement: .principal) {
                
                        Text("Резюме")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                
                    ToolbarItem(placement: .topBarTrailing) {
                        withAnimation(.spring) {
                            Menu {
                                NavigationLink{
                                    CvUpdateSCREEN(cv: self.cv)
                                }label:{
                                    Text("Редактировать резюме")
                                }
                                
                                Divider()
                                
                                Button(role: .destructive) {
                                    self.deleteCV_isAllertShow.toggle()
                                }label:{
                                    Text("Удалить резюме")
                                }
                            }label: {
                                Image(systemName: "ellipsis")
                                    .rotationEffect(.degrees(90))
                                    .frame(width: 20, height: 30)
                                    .padding(4)
                                    .padding(.trailing, 13)
                                    .foregroundStyle(Color("AccentColor"))
                            }
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}


#Preview {
    CvFullInfoSCREEN(cv: CvData(
        age: 20,
        position: "IOS - developer",
        firstName: "Руслан",
        secondName: "Хамдамов",
        patronymicName: "Арсланович",
        birthDate: "25.12.2000",
        birthCountry: "Чехия",
        phoneNumber: "+998(97)231-43-21",
        university: "Казанский (Приволжский) Федеральный университет",
        institute: "Институт вычислительной математики и информационных технологий",
        direction: "Фундаментальная математика и информационные технологии",
        anotherEducation: "-",
        certificates: "IELTS 10",
        skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
        money: "от 100 000 до 300 000 руб",
        workExperience: "Лаборатория КФУ",
        employmentType: "Полная занятость",
        aboutMe: "Очень хороший человек"))
    .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
