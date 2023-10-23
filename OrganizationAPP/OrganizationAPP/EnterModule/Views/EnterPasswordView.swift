import SwiftUI

struct EnterPasswordView: View {
   
    @EnvironmentObject var viewModel:EnterViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white)
            
            VStack {
                Text("Личные данные")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "Почта*", result: self.$viewModel.organization.email)
                
                CustomTextFieldView(isSecureField: false, text: "Пароль*", result: self.$viewModel.organization.password)
                
                CustomTextFieldView(isSecureField: false, text: "Повторить пароль*", result: self.$viewModel.secondPassword)
                
                
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
                                .foregroundStyle(.black)
                        }
                        
                        VStack(alignment: .leading){

                            Text("Я согласен(-а) на получение")
                            Text("рассылки на e-mail")
                        }
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
                                .foregroundStyle(.black)
                        }
                       
                        VStack(alignment: .leading) {
                            Text("Я согласен(-а) с ")
                            Text("пользовательским соглашением")
                        }
                        Spacer()
                    }
                }
                
                Text("*Обязательное поле")
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
                            .foregroundColor(.black)
                        
                        Text("Зарегистрироваться")
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
        .environmentObject(EnterViewModel())
}
