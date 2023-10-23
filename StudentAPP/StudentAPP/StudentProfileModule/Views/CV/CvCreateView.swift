import SwiftUI

struct CvCreateView: View {
    
    @EnvironmentObject var viewModel:ProfileViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            
            Group {
                HStack {
                    Text("Фамилия")
                        .font(.system(size:15))
                    
                    Spacer()
                }
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.secondName, size: 0)
            }
            
            Group {
                Text("Имя")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.firstName, size: 0)
            }
            
            Group {
                Text("Отчество")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.patronymicName, size: 0)
            }
            
            Group {
                Text("Дата рождения")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.birthDate, size: 0)
            }
            
            Group {
                Text("Гражданство")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.birthCountry, size: 0)
            }
            Group {
                Text("Телефон")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.phoneNumber, size: 0)
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("Образование")
                    .foregroundColor(.black)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                
                Text("Университет")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.university, size: 0)
            }
            
            Group {
                Text("Институт")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.institute, size: 0)
            }
            Group {
                Text("Направление")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.direction, size: 0)
            }
            Group {
                Text("Дополнительное образование")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.anotherEducation, size: 0)
            }
            Group {
                Text("Сертификаты, рекомендательные письма")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.certificates, size: 0)
            }
            
            Spacer()
                .frame(height: 0)
            
            Group {
                Text("Основное")
                    .foregroundColor(.black)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                
                Text("Навыки")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.skills, size: 0)
            }
            
            Group {
                Text("Желаемый уровень заработной платы")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.money, size: 0)
            }
            Group {
                Text("Тип занятости")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.workExperience, size: 0)
            }
            Group {
                Text("Опыт работы")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.employmentType, size: 0)
            }
            Group {
                Text("Обо мне")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.cv.aboutMe, size: 0)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CvCreateView()
        .environmentObject(ProfileViewModel())
}
