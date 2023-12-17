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
                        
                        Button {
                            self.viewModel.updateDataProfile()
                        } label: {
                            Text("save changes")
                        }
                        .buttonStyle(.bordered)
                        
                        Spacer()
                    }
                }
                
                if self.viewModel.isLoading {
                    LoadSpinnerView()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            
                ToolbarItem(placement: .topBarLeading) {
            
                    Button {
                        self.dismiss()
                        self.viewModel.disableChanges()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                            .foregroundStyle(Color("SecondaryColor"))
                    }
                }
            
                ToolbarItem(placement: .principal) {
            
                    Text("18")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("SecondaryColor"))
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
        }
        .onAppear {
            self.viewModel.getNewDataToChange()
        }
        
    }
}
#Preview {
    EditAccountSCREEN()
        .environmentObject(ProfileViewModel(userStateManager: UserStateManager()))
}
