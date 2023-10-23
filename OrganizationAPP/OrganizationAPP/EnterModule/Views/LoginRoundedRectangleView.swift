import SwiftUI

struct LoginRoundedRectangleView: View {
  
    @Binding var loginText:String
    @Binding var passwodText:String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 287)
                .foregroundStyle(.white)
            
            VStack(alignment: .center) {
                Text("Личные данные")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "Логин", result: self.$loginText)
                
                Spacer()
                    .frame(height: 10)
                
                CustomTextFieldView(isSecureField: true, text: "Пароль", result: self.$passwodText)
                
                Spacer()
                    .frame(height: 20)
                
                NavigationLink {
                    TabViewOfAPP()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 293, height: 50)
                            .foregroundColor(.black)
                        
                        Text ("Вход")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
                Button{}label: {
                    Text("Забыли пароль")
                        .font(.system(size: 15))
                        .underline()
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    LoginRoundedRectangleView(loginText: .constant(""), passwodText: .constant(""))
}
