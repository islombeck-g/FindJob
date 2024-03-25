import SwiftUI

struct PartTwoOfRegistrationForm: View {
    
    @EnvironmentObject private var presenter: AuthPresenter
    private let formatter = PhoneFormatter()
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color("SecondaryColor"))
                
                VStack(alignment: .center) {
                    Text(LocalizedStringKey("Личные данные"))
                        .bold28ForegColor()
                        .padding(.top,  20)
                    
                    ZStack {
                        VStack {
                            
                            CustomTextField(isSecureField: false, text: "Номер телефона*", result: self.$presenter.user.phoneNumber)
                                .onChange(of: presenter.user.phoneNumber) { oldValue, newValue in
                                    presenter.user.phoneNumber = formatter.format(number: newValue)
                                }
                            Button {} label: {
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(
                                            height: 46)
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(Color("AccentColor"))
                                    
                                    Text("Прикрепить аватар")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                                
                            }
                            
                            
                            Text("*Обязательное поле")
                                .font(.system(size: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color("darkGray"))
                            
                            Button {
                                withAnimation {
                                    if self.presenter.checkPartTwo() {
                                        self.presenter.registrationPartTwo()
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
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 60)
                        
                        VStack {
                            DropDownMenuView(menuActions: universities, title: self.$presenter.user.university)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                }
                
                .padding(.horizontal)
            }
            .frame(maxHeight: 370)
            Spacer()
        }
    }
}

#Preview {
    PartTwoOfRegistrationForm()
        .environmentObject(AuthPresenter())
}
