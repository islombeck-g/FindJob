import SwiftUI

struct CVTextField: View {
    
    @Binding var cv:CvData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                Group {
                    HStack {
                        Text("Фамилия")
                            .font(.system(size:15))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.secondName, size: 0)
                }
                
                Group {
                    Text("Имя")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.firstName, size: 0)
                }
                
                Group {
                    Text("Отчество")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.patronymicName, size: 0)
                }
                
                Group {
                    Text("Дата рождения")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.birthDate, size: 0)
                }
                
                Group {
                    Text("Гражданство")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.birthCountry, size: 0)
                }
                Group {
                    Text("Телефон")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.phoneNumber, size: 0)
                }
            }
            
            
            Spacer()
                .frame(height: 0)

            Group {
                Group {
                    Text("Образование")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    
                    Text("Университет")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.university, size: 0)
                }
                
                Group {
                    Text("Институт")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.institute, size: 0)
                }
                Group {
                    Text("Направление")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.direction, size: 0)
                }
                Group {
                    Text("Дополнительное образование")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.anotherEducation, size: 0)
                }
                Group {
                    Text("Сертификаты, рекомендательные письма")
                        .fontWeight(.bold)
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.certificates, size: 0)
                }

            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("Основное")
                    .foregroundColor(.black)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                
                Text("Навыки")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.skills, size: 0)
            }
            Group {
                Text("Желаемая должность")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.position, size: 0)
            }
            
            Group {
                Text("Желаемый уровень заработной платы")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.money, size: 0)
            }
            Group {
                Text("Тип занятости")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.workExperience, size: 0)
            }
            Group {
                Text("Опыт работы")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.employmentType, size: 0)
            }
            Group {
                Text("Обо мне")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.aboutMe, size: 0)
            }
        }
        .foregroundStyle(Color("SecondaryColor"))
        .padding(.horizontal, 16)
    }
}

#Preview {
    CVTextField(cv: .constant(CvData(
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
}
