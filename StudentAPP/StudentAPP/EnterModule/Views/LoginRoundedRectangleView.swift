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
                Text(LocalizedStringKey("7"))
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: LocalizedStringKey("8"), result: self.$loginText)
                
                Spacer()
                    .frame(height: 10)
                
                CustomTextFieldView(isSecureField: true, text: LocalizedStringKey("9"), result: self.$passwodText)
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    self.viewModel.tryRegistration()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 293, height: 50)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text(LocalizedStringKey("3"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
                Button{
                    
                }label: {
                    Text(LocalizedStringKey("10"))
                        .font(.system(size: 15))
                        .underline()
                        .foregroundStyle(Color("ForegroundColor"))
                }
            }
        }
        
    }
}

#Preview {
    LoginSCREEN()
        .environmentObject(EnterViewModel(userStateManager: UserStateManager()))
    
//    LoginRoundedRectangleView(loginText: .constant(""), passwodText: .constant(""))
//        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}
