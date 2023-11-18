import SwiftUI

struct EditAccount: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            Color("ForegroundColor").ignoresSafeArea()
            
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
                .foregroundColor(Color("SecondaryColor"))
                .fontWeight(.regular)
                
                
                
                ScrollView {
                    ProfileEditCenterImage(image: self.viewModel.student.image)
                    
                    EditProfileViewItems()
                        .environmentObject(self.viewModel)
                    
                    Spacer()
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
        }
        
    }
    
}
#Preview {
    EditAccount()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
