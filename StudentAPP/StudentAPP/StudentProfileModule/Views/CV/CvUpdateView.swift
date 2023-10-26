import SwiftUI

struct CvUpdateView: View {
    
    @Environment (\.dismiss) var dismiss
    @Binding var cv:CvData
    
    var body: some View {
        VStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack{
                    
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
                        
                        Text("Редактировать резюме")
                            .padding(.trailing, 35)
                        
                        Spacer()
                    }
                    .font(.system(size: 18))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Spacer()
                            .frame(height: 10)
                        
                        ScrollView {
                            
                            CVTextField(cv: self.$cv)
                            
                        }
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    CvUpdateView(cv: .constant(CvData(
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
