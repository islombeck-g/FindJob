import SwiftUI

struct LoginRoundedRectangleForm: View {
    
    @EnvironmentObject var presener: AuthPresenter
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack(alignment: .center) {
                Text(LocalizedStringKey("Личные данные"))
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldForm(isSecureField: false, text: "Почта", result: self.$presener.email)
                
                if self.presener.emailError != nil {
                    Text(self.presener.emailError!.errorDescription!)
                        .errorText()
                }
                
                
                Spacer()
                    .frame(height: 10)
                
                CustomTextFieldForm(isSecureField: true, text: "Пароль", result: self.$presener.password)
                
                if self.presener.passwordError != nil {
                    Text(self.presener.passwordError!.errorDescription!)
                        .errorText()
                }
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    self.presener.registration()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 50)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text(LocalizedStringKey("Регистрация"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 20)
        }
        
    }
}

#Preview {
    LoginRoundedRectangleForm()
//        .environmentObject(AuthPresenter(router: AppRouter.shared))
        .environmentObject(AuthPresenter())
}
