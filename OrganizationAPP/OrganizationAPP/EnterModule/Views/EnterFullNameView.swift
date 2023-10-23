import SwiftUI

struct EnterFullNameView: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white)
            
            VStack(alignment: .center) {
                Text("Личные данные")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: "Название компании*", result: self.$viewModel.organization.name)
                
                CustomTextFieldView(isSecureField: false, text: "Адрес*", result: self.$viewModel.organization.adress)
                
                CustomTextFieldView(isSecureField: false, text: "Телефон", result: self.$viewModel.organization.phoneNumber)
                
                Spacer()
                    .frame(height: 20)
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
                        
                        Text("Далее")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(
            width: 343,
            height: 403,
            alignment: .center)
    }
}


#Preview {
    EnterFullNameView()
        .environmentObject(EnterViewModel())
}
