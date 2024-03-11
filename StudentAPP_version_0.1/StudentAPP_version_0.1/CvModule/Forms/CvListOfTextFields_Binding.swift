import SwiftUI

struct CvListOfTextFields_Binding: View {
    
    @Bindable var cv: CvData
    
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
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.secondName)
                }
                Group {
                    Text("Имя")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.firstName)
                }
                Group {
                    Text("Отчество")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.patronymicName)
                }
                Group {
                    Text("Дата рождения")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.birthDate)
                }
                Group {
                    Text("Гражданство")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.birthCountry)
                }
                Group {
                    Text("Телефон")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.phoneNumber)
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
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.university)
                }
                Group {
                    Text("Институт")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.institute)
                }
                Group {
                    Text("Направление")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.direction)
                }
                Group {
                    Text("Дополнительное образование")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.anotherEducation)
                }
                Group {
                    Text("Сертификаты, рекомендательные письма")
                        .fontWeight(.bold)
                    CustomTextField(isSecureField: false, text: "", result: self.$cv.certificates)
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
                CustomTextField(isSecureField: false, text: "", result: self.$cv.skills)
            }
            Group {
                Text("Желаемая должность")
                    .fontWeight(.bold)
                CustomTextField(isSecureField: false, text: "", result: self.$cv.position)
            }
            Group {
                Text("Желаемый уровень заработной платы")
                    .fontWeight(.bold)
                CustomTextField(isSecureField: false, text: "", result: self.$cv.money)
            }
            Group {
                Text("Тип занятости")
                    .fontWeight(.bold)
                CustomTextField(isSecureField: false, text: "", result: self.$cv.workExperience)
            }
            Group {
                Text("Опыт работы")
                    .fontWeight(.bold)
                CustomTextField(isSecureField: false, text: "", result: self.$cv.employmentType)
            }
            Group {
                Text("Обо мне")
                    .fontWeight(.bold)
                CustomTextField(isSecureField: false, text: "", result: self.$cv.aboutMe)
            }
        }
        .padding(.horizontal, 16)
        .foregroundStyle(Color("SecondaryColor"))
    }
}

//#Preview {
//    CvListOfTextFields_Binding()
//}
