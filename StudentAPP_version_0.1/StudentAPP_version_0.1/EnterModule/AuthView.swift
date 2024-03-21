import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject var presenter: AuthPresenter
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ForegroundColor")
                    .ignoresSafeArea()
                VStack {
                    Group {
                        Text("Здравствуйте!")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        Text("Биржа талантов - возможность \n получить любимую работу")
                            .font(.system(size: 20))
                            
                    }
                    .foregroundStyle(Color("SecondaryColor"))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    
                    Group {
                        Button {
                            self.presenter.navigateTo(route: .logIn)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 343, height: 46)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Text (LocalizedStringKey("Вход"))
                                    .foregroundStyle(Color("ForegroundColor"))
                                    .fontWeight(.bold)
                            }
                        }

                        Button {
                            self.presenter.navigateTo(route: .registration)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                                    .frame(width: 343, height: 46)
                                
                                Text(LocalizedStringKey("Регистрация"))
                                    .foregroundStyle(Color("SecondaryColor"))
                                    .fontWeight(.bold)
                            }
                        }
                        
                        
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(AuthPresenter())
}
