import SwiftUI

struct EditProfileViewItems: View {
   
    @EnvironmentObject var viewModel: StudentProfileViewModel
    
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
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.newBirthday, size: 0)
            }
            Group {
                Text("О себе")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.newAboutMe, size: 0)
            }
            Group {
                Text("Университет")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.newUniversity, size: 0)
            }
            Group {
                Text("Институт")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.newInstitute, size: 0)
            }
            Group {
                Text("Направление")
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.newDirection, size: 0)
            }
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    EditProfileViewItems()
        .environmentObject(StudentProfileViewModel())
}
