import SwiftUI

struct EditProfileViewItems: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                HStack {
                    Text("Фамилия")
                        .font(.system(size:15))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.secondName, size: 0)
            }
            
            Group {
                Text("Имя")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.firstName, size: 0)
                
            }
            
            Group {
                Text("Отчество")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.patronymicName, size: 0)
            }
            
            Group {
                Text("Дата рождения")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.birthDate, size: 0)
            }
            Group {
                Text("О себе")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.aboutMe, size: 0)
            }
            Group {
                Text("Университет")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.university, size: 0)
            }
            Group {
                Text("Институт")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.institute, size: 0)
            }
            Group {
                Text("Направление")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.direction, size: 0)
            }   
        }
        .foregroundStyle(Color("SecondaryColor"))
        .padding(.horizontal, 16)
    }
}

#Preview {
    EditProfileViewItems()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
