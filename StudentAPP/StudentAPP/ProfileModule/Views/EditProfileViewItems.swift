import SwiftUI

struct EditProfileViewItems: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            
            Group {
                HStack {
                    Text("Фамилия")
                        .font(.system(size:15))
                    
                    Spacer()
                }
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.secondName, size: 0)
            }
            
            Group {
                Text("Имя")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.firstName, size: 0)
                
            }
            
            Group {
                Text("Отчество")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.patronymicName, size: 0)
            }
            
            Group {
                Text("Дата рождения")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.birthDate, size: 0)
            }
            Group {
                Text("О себе")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.aboutMe, size: 0)
            }
            Group {
                Text("Университет")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.university, size: 0)
            }
            Group {
                Text("Институт")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.institute, size: 0)
            }
            Group {
                Text("Направление")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.direction, size: 0)
            }
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    EditProfileViewItems()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
