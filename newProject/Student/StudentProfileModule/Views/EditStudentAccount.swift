import SwiftUI

struct EditStudentAccount: View {
    
    @EnvironmentObject var viewModel: StudentProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            HStack{
                Button {
                    self.viewModel.updateAfterChangeInEditView()
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
                UserProfileEditCenterImage(image: self.viewModel.student.image)
                
                StudentEditViewItems()
                    .environmentObject(self.viewModel)
                
                Spacer()
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    EditStudentAccount()
        .environmentObject(StudentProfileViewModel())
}
