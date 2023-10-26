import SwiftUI

struct EditAccount: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .padding(.leading, 15)
                        .font(.system(size: 25))
                }
                
                Text("Редактирование профиля")
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 25)
                
            }

            .fontWeight(.regular)
            .foregroundStyle(.black)
            
            
            ScrollView {
                ProfileEditCenterImage(image: self.viewModel.student.image)
                
                EditProfileViewItems()
                    .environmentObject(self.viewModel)
                
                Spacer()
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}
#Preview {
    EditAccount()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
