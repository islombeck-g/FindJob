import SwiftUI

struct EditProfileViewItems: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                HStack {
                    Text("33")
                        .font(.system(size:15))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.secondName, size: 0)
            }
            
            Group {
                Text("34")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.firstName, size: 0)
                
            }
            
            Group {
                Text("35")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.patronymicName, size: 0)
            }
            
            Group {
                Text("27")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.birthDate, size: 0)
            }
            Group {
                Text("32")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.aboutMe, size: 0)
            }
            Group {
                Text("29")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.university, size: 0)
            }
            Group {
                Text("30")
                    .fontWeight(.bold)
                CustomTextFieldWithSize(isSecureField: false, text: "", result: self.$viewModel.student.institute, size: 0)
            }
            Group {
                Text("31")
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
