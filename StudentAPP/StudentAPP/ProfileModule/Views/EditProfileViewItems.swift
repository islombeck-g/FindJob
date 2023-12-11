import SwiftUI

struct EditProfileViewItems: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                HStack {
                    Text(LocalizedStringKey("33"))
                        .font(.system(size:15))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.secondName, size: 0)
            }
            
            Group {
                Text(LocalizedStringKey("34"))
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.firstName, size: 0)
                
            }
            
            Group {
                Text(LocalizedStringKey("35"))
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.patronymicName, size: 0)
            }
            
            Group {
                Text(LocalizedStringKey("27"))
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.birthDate, size: 0)
            }
            Group {
                Text(LocalizedStringKey("32"))
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.aboutMe, size: 0)
            }
            Group {
                Text(LocalizedStringKey("29"))
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.university, size: 0)
            }
            Group {
                Text(LocalizedStringKey("30"))
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.institute, size: 0)
            }
            Group {
                Text(LocalizedStringKey("31"))
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
