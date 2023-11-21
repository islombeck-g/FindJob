import SwiftUI

struct CvUpdateSCREEN: View {
    
    @Environment (\.dismiss) var dismiss
    @Binding var cv:CvData
    
    var body: some View {
        VStack {
            ZStack {
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack{
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Spacer()
                            .frame(height: 10)
                        
                        ScrollView {
                            
                            CVTextField(cv: self.$cv)
                            
                        }
                        
                    }
                    
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
                
                        Text("Редактировать резюме")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CvUpdateSCREEN(cv: .constant(CvData(
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
//        .environmentObject(ProfileViewModel())
}
