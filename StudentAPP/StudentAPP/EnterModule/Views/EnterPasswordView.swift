import SwiftUI

struct EnterPasswordView: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack {
                Text(LocalizedStringKey("7"))
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "77", result: self.$viewModel.student.email)
                
                CustomTextFieldView(isSecureField: false, text: "78", result: self.$viewModel.passwodText)
                
                CustomTextFieldView(isSecureField: false, text: "79", result: self.$viewModel.secondPassword)
                
                
                Group {
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 25)
                        
                        Button {
                            self.viewModel.emailAgree.toggle()
                        }label: {
                            Image(systemName: self.viewModel.emailAgree == true ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(Color("AccentColor"))
                        }
                        
                        Text("80")
                            .foregroundStyle(Color("ForegroundColor"))
                        Spacer()
                    }
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 25)
                        
                        Button{
                            self.viewModel.userAgreement.toggle()
                        }label: {
                            Image(systemName: self.viewModel.userAgreement == true ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(Color("AccentColor"))
                        }
                        
                        Text("81")
                            .foregroundStyle(Color("ForegroundColor"))
                        
                        Spacer()
                    }
                }
                
                Text("68")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 41)
                    .foregroundStyle(Color("darkGray"))
                
                Button {
                    self.viewModel.nextTabView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(
                                width: 293,
                                height: 46)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text("82")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(
            width: 343,
            height: 454,
            alignment: .center)
    }
}

#Preview {
    EnterPasswordView()
        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}
