import SwiftUI

struct LoginSCREEN: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            
                ZStack {
                    
                    Color("ForegroundColor")
                        .ignoresSafeArea()
                    ScrollView {
                        
                    VStack(alignment: .leading){
                        
                        Group {
                            Spacer()
                                .frame(height: 37.5)
                            
                            Text("Вход")
                                .foregroundStyle(Color("SecondaryColor"))
                                .font(.system(size: 34))
                                .fontWeight(.semibold)
                                .padding(.horizontal, 20)
                            
                            Spacer()
                                .frame(height: 24)
                        }
                        .padding(.leading, 8)
                        
                        LoginRoundedRectangleView(
                            loginText: self.$viewModel.loginText,
                            passwodText: self.$viewModel.passwodText)
                        .environmentObject(self.viewModel)
                        .frame(
                            width: 343,
                            height: 287)
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                            .frame(height: 24)
                        
                        Text("Войти с помощью")
                            .foregroundStyle(Color("SecondaryColor"))
                            .frame(maxWidth: .infinity)
                        
                        NavigationLink {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(
                                        width: 343,
                                        height: 48)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Image("vk_icon")
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                    }
                }
                    .scrollIndicators(.hidden)
            }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            self.dismiss()
                        } label: {
                                
                                Image(systemName: "chevron.left")
                                Text("Назад")
                        }
                        .font(.system(size: 19))
                        .fontWeight(.regular)
                        .foregroundStyle(Color("SecondaryColor"))
                    }
                    
                }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}


#Preview {
    LoginSCREEN()
        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}
