import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel:LogInViewModel = LogInViewModel()
    //    @Environment(\.dismiss) var dismiss
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                    VStack(alignment: .leading){
                        
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
                            
                            Text("Вход")
                                .foregroundColor(.white)
                                .font(.system(size: 34))
                                .fontWeight(.semibold)
                                .padding(.horizontal, 20)
                            
                            Spacer()
                                .frame(height: 24)
                        }
                        
                        
                        LoginRoundedRectangleView(
                            loginText: self.$viewModel.loginText,
                            passwodText: self.$viewModel.passwodText)
                        .frame(
                            width: 343,
                            height: 287)
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                            .frame(height: 24)
                        
                        
                        Text("Войти с помощью")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                     
                        
                        NavigationLink {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(
                                        width: 343,
                                        height: 48)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                
                                Image("vk_icon")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                            }
                            
                        }
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 8)
//                                    .foregroundStyle(.white)
//                                    .frame(
//                                        width: 100,
//                                        height: 100)
//                                Image("vk_icon")
//                            }
//                            .position(x: geometry.size.width / 2)
                        Spacer()
                        }
                
                    
                }
            }
            .navigationBarBackButtonHidden(true)
        
        }
    }


#Preview {
    LoginView()
}



