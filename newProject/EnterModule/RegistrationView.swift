import SwiftUI

struct RegistrationView: View {

    @StateObject private var viewModel: RegistrationViewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var doneChoseRole = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        
                        Button {
                              self.dismiss()
                        } label: {
                            HStack{
                                    
                                Image(systemName: "chevron.left")
                                
                                Text("Назад")
                                
                                Spacer()
                            }
                            .font(.system(size: 19))
                            .fontWeight(.regular)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                            .frame(height: 37.5)
                        
                        Text("Регистрация")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 34))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                            .frame(height: 24)
                    }
                    RoleChose(doneChoseRole: $doneChoseRole)
                        .environmentObject(viewModel)
                    
                    Spacer()
                }
                
            }
           
            
        }
        
    }
}

#Preview {
    RegistrationView()
}
