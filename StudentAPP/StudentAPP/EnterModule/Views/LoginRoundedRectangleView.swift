import SwiftUI

struct LoginRoundedRectangleView: View {
    
    @EnvironmentObject var viewModel: EnterViewModel
    @Binding var loginText:String
    @Binding var passwodText:String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 287)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack(alignment: .center) {
                Text("Личные данные")
//                    .foregroundStyle(.black)
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "Логин", result: self.$loginText)
                
                Spacer()
                    .frame(height: 10)
                
                CustomTextFieldView(isSecureField: true, text: "Пароль", result: self.$passwodText)
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    self.viewModel.sendData()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 293, height: 50)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text ("Вход")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
                Button{
                    
                }label: {
                    Text("Забыли пароль")
                        .font(.system(size: 15))
                        .underline()
                        .foregroundStyle(Color("ForegroundColor"))
                }
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
    
//    LoginRoundedRectangleView(loginText: .constant(""), passwodText: .constant(""))
//        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}
