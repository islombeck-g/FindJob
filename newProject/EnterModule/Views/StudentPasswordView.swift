import SwiftUI

struct StudentPasswordView: View {
    
    @EnvironmentObject var viewModel:RegistrationViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.blue)
            
            VStack {
                Text("Личные данные")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "Почта*", result: self.$viewModel.student.email)
                
                CustomTextFieldView(isSecureField: false, text: "Пароль*", result: self.$viewModel.student.password)
                
                CustomTextFieldView(isSecureField: false, text: "Повторить пароль*", result: self.$viewModel.secondPassword)
                
                
                Group {
                    HStack {
                        Image(systemName: self.viewModel.emailAgree == true ? "largecircle.fill.circle" : "circle")
                            .clipShape(Circle())
                        Text("Я согласен(-а) на получение рассылки на e-mail")
                            .lineLimit(2)
                    }
                    HStack {
                        Image(systemName: self.viewModel.userAgreement == true ? "largecircle.fill.circle" : "circle")
                            .clipShape(Circle())
                        Text("Я согласен(-а) с пользовательским соглашением")
                            .lineLimit(2)
                    }
                }
                
                Text("*Обязательное поле")
                    .font(.system(size: 17))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 41)
                    .foregroundStyle(Color("darkGray"))
                
                
                Button {
                    
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
    StudentPasswordView()
        .environmentObject(RegistrationViewModel())
}
