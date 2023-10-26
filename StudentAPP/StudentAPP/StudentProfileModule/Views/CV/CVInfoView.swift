import SwiftUI

struct CVInfoView: View {
    
    @Binding var cv: CvData
    
    var body: some View {
        VStack {
            ZStack {
         
                Color("buttonBlue")
                    .frame(maxWidth: .infinity, maxHeight: 175)
                    .clipShape(.rect(cornerRadius: 15))
                
                VStack(alignment: .leading) {
                    HStack{ Spacer() }
                    
                    Text(cv.position)
                        .lineLimit(1)
                        .font(.system(size: 17))
                        .bold()
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Group {
                        Text("Возраст: \(cv.age) лет")
                        Text(cv.employmentType)
                            .lineLimit(1)
                        Text("ВУЗ: \(cv.university)")
                            .lineLimit(1)
                    }
                    .font(.system(size: 9))
                    
                    Spacer()
                        .frame(height: 4)
                    
                    Text(cv.money)
                        .lineLimit(1)
                   
                    Spacer()
                        .frame(height: 10)
                    
                    Text(cv.aboutMe)
                        .font(.system(size: 12))
                        .lineLimit(2)
                    
                }
//                .padding(.horizontal, 10)
//                .padding(.vertical, 20)
                .padding(.all, 10)
                .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 16)
    }
}

//#Preview {
//    CVInfoView()
//}


//@State private var cv:CvData = CvData(
//    age: 20,
//    position: "IOS - developer",
//    firstName: "Руслан",
//    secondName: "Хамдамов",
//    patronymicName: "Арсланович",
//    birthDate: "25.12.2000",
//    birthCountry: "Чехия",
//    phoneNumber: "+998(97)231-43-21",
//    university: "Казанский (Приволжский) Федеральный университет",
//    institute: "Институт вычислительной математики и информационных технологий",
//    direction: "Фундаментальная математика и информационные технологии",
//    anotherEducation: "-",
//    certificates: "IELTS 10",
//    skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
//    money: "от 100 000 до 300 000 руб",
//    workExperience: "Лаборатория КФУ",
//    employmentType: "Полная занятость",
//    aboutMe: "Очень хороший человек Очень хороший человек Очень хороший человек Очень хороший человек Очень хороший человек")