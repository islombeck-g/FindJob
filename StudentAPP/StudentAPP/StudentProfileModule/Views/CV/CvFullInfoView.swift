import SwiftUI

struct CvFullInfoView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment (\.dismiss) var dismiss
    @Binding var cv:CvData
    
    @State private var logOut_isAllertShow:Bool = false
    @State private var deleteCV_isAllertShow:Bool = false
    @State private var isFavorite = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
                
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
                        
                        Text("Резюме")
                        
                        
                        Spacer()
                        
                        Menu {
                            NavigationLink{
                               
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
                        }
                    }
                    .font(.system(size: 18))
                    
                    
                    ScrollView {
                        
                        ProfileImage(
                            name: self.$viewModel.student.firstName,
                            secondName: self.$viewModel.student.secondName,
                            patronymicName: self.$viewModel.student.patronymicName,
                            image: self.$viewModel.student.image,
                            phoneNumber: self.$viewModel.student.phoneNumber)
                            .padding(.vertical, 16)
                         
                        Spacer()
                            .frame(height: 25)
                        
                        CvFullInfoListView()
                            .environmentObject(self.viewModel)
                        
                        Spacer()
                            .frame(height: 30)
                        
                      
                        Divider()
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        .alert("Удалить аккаунт?", isPresented: self.$deleteCV_isAllertShow) {
                            Button{}label: {
                                Text("Отмена")
                            }
                                
                            Button{
                                //удалить резюме
                            }label: {
                                Text("Удалить")
                            }
                        } message: {
                            Text("Восстановление аккаунта невозможно после удаления.")
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}


#Preview {
    CvFullInfoView(cv: .constant(CvData(
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
        aboutMe: "Очень хороший человек")))
        .environmentObject(ProfileViewModel())
}
