import SwiftUI

struct CvUpdateView: View {
    
    @EnvironmentObject var viewModel:ProfileViewModel
    
    @State private var cv:CvData = CvData(
                age: 0,
                position: "",
                firstName: "",
                secondName: "",
                patronymicName: "",
                birthDate: "",
                birthCountry: "",
                phoneNumber: "",
                university: "",
                institute: "",
                direction: "",
                anotherEducation: "",
                certificates: "",
                skills: "",
                money: "",
                workExperience: "",
                employmentType: "",
                aboutMe: "")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                Group {
                    HStack {
                        Text("Фамилия")
                            .font(.system(size:15))
                        
                        Spacer()
                    }
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.secondName, size: 0)
                }
                
                Group {
                    Text("Имя")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.firstName, size: 0)
                }
                
                Group {
                    Text("Отчество")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.patronymicName, size: 0)
                }
                
                Group {
                    Text("Дата рождения")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.birthDate, size: 0)
                }
                
                Group {
                    Text("Гражданство")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.birthCountry, size: 0)
                }
                Group {
                    Text("Телефон")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.phoneNumber, size: 0)
                }
            }
            
            
            Spacer()
                .frame(height: 0)

            Group {
                Group {
                    Text("Образование")
                        .foregroundColor(.black)
                        .font(.system(size:20))
                        .fontWeight(.bold)
                    
                    Text("Университет")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.university, size: 0)
                }
                
                Group {
                    Text("Институт")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.institute, size: 0)
                }
                Group {
                    Text("Направление")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.direction, size: 0)
                }
                Group {
                    Text("Дополнительное образование")
                    
                    CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.anotherEducation, size: 0)
                }
                Group {
                    Text("Сертификаты, рекомендательные письма")
                    
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
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.skills, size: 0)
            }
            
            Group {
                Text("Желаемый уровень заработной платы")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.money, size: 0)
            }
            Group {
                Text("Тип занятости")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.workExperience, size: 0)
            }
            Group {
                Text("Опыт работы")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.employmentType, size: 0)
            }
            Group {
                Text("Обо мне")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$cv.aboutMe, size: 0)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CvUpdateView()
}
