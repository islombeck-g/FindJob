import SwiftUI

struct EditAccountSCREEN: View {
   
    @EnvironmentObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor").ignoresSafeArea()
                
                VStack {
                    
                    ScrollView {
                        ProfileEditCenterImage(image: self.viewModel.student.image)
                        
                        EditProfileViewItems()
                            .environmentObject(self.viewModel)
                        
                        Spacer()
                    }
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                
                    ToolbarItem(placement: .topBarLeading) {
                
                        Button {
                            self.dismiss()
                
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19))
                                .fontWeight(.regular)
                                .foregroundStyle(Color("SecondaryColor"))
                        }
                    }
                
                    ToolbarItem(placement: .principal) {
                
                        Text("Редактирование профиля")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
                .navigationBarBackButtonHidden(true)
                .toolbar(.hidden, for: .tabBar)
                
            }
        }
        
        
    }
    
}
#Preview {
    EditAccountSCREEN()
        .environmentObject(ProfileViewModel(userStateViewModel: UserStateViewModel()))
}
