import SwiftUI

struct PartTwoOfRegistrationForm: View {
    
    @EnvironmentObject private var presenter: AuthPresenter
    
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
                            
                            Spacer()
                                .frame(height: 80)
                            
                            Text("*Обязательное поле")
                                .font(.system(size: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color("darkGray"))
                            
                            Button {
                                withAnimation {
                                    if self.presenter.checkPartOne() {
                                        self.presenter.nextView.toggle()
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
                        .padding(.top, 20)
                        VStack {
                            DropDownMenuView(menuActions: universities, title: self.$presenter.user.university)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                    
                    
                    
                    Spacer()
                    
                }
                
                .padding(.horizontal)
            }
            .frame(maxHeight: 440)
            Spacer()
        }
        
    }
}

#Preview {
    PartTwoOfRegistrationForm()
        .environmentObject(AuthPresenter())
}
