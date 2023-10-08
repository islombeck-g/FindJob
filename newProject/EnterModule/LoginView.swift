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
                
                GeometryReader { geometry in
                    VStack(alignment: .leading){
                        
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
                        
                        Spacer()
                            .frame(height: 24)
                        
                        

                        LoginRoundedRectangleView(loginText: self.$viewModel.loginText, passwodText: self.$viewModel.passwodText)
//                            .position(x: geometry.size.width/2)
                            .padding(.horizontal, 16)
                        
                        //                        Spacer()
                        //                        ZStack {
                        
                        //                            VStack {
                        //                                Text("Личные данные")
                        //                                    .font(.system(size: 28))
                        //                                CustomTextFieldView(isSecureField: false, text: "Логин", result: self.$viewModel.loginText)
                        //
                        //                                CustomTextFieldView(isSecureField: true, text: "Пароль", result: self.$viewModel.passwodText)
                        //                            }
                        //
                        //                        }
                        //                        Spacer()
                        //
                        //                        //enter with other methods
                        //                        Group{
                        //                            Text("Войти с помощью:")
                        //                                .foregroundColor(.white)
                        //                                .fontWeight(.bold)
                        //                                .font(.system(size: 17))
                        //                            Spacer()
                        //                                .frame(height: 10)
                        //                            Button {
                        //                                //enter with vk
                        //                            } label: {
                        //                                ZStack {
                        //                                    RoundedRectangle(cornerRadius: 8)
                        //                                        .foregroundColor(.white)
                        //                                        .frame(width: UIScreen.main.bounds.width - 32, height: 46)
                        //                                    Image("vkIcon")
                        //
                        //                                }
                        //                            }
                        //                        }
                        
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
