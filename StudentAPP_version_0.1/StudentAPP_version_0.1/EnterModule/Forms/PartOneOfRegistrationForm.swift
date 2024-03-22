import SwiftUI

struct PartOneOfRegistrationForm: View {
    
    @EnvironmentObject private var presenter: AuthPresenter
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color("SecondaryColor"))
                
                VStack(alignment: .center) {
                    Text(LocalizedStringKey("Личные данные"))
                        .bold28ForegColor()
                    
                    CustomTextField(isSecureField: false, text: "Имя*", result: self.$presenter.user.firstName)
                    
                    CustomTextField(isSecureField: false, text: "Фамилия*", result: self.$presenter.user.secondName)
                    
                    CustomTextField(isSecureField: false, text: "Отчество*", result: self.$presenter.user.patronymicName)
                    
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("*Обязательное поле")
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color("darkGray"))
                    
                    Button {
                        withAnimation {
                            if self.presenter.checkPartOne() {
                                self.presenter.nextView = 1
                            }
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(
                                    height: 46)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("AccentColor"))
                            
                            Text("Далее")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxHeight:  410, alignment: .top)
            Spacer()
        }
       
    }
}

#Preview {
    PartOneOfRegistrationForm()
        .environmentObject(AuthPresenter())
}
