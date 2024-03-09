import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var router: AppRouter
    @EnvironmentObject var presenter: AuthPresenter
    
    var body: some View {
        ZStack {
            
            Color("ForegroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading){
                    
                    Group {
                        Spacer()
                            .frame(height: 37.5)
                        
                        Text(LocalizedStringKey("Регистрация"))
                            .foregroundStyle(Color("SecondaryColor"))
                            .font(.system(size: 34))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                            .frame(height: 24)
                    }
                    .padding(.leading, 8)
                    
                    LoginRoundedRectangleForm()
                    .frame(
                        width: 343,
                        height: 287)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    Text(LocalizedStringKey("Войти с помощью"))
                        .foregroundStyle(Color("SecondaryColor"))
                        .frame(maxWidth: .infinity)
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(
                                    width: 343,
                                    height: 48)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("SecondaryColor"))
                            
                            Image("vk_icon")
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
            
            if self.presenter.isLoading {
                ProgressView()
            }
                
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.router.navigateBack()
                } label: {
                    
                    Image(systemName: "chevron.left")
                    Text(LocalizedStringKey("Назад"))
                }
                .font(.system(size: 19))
                .fontWeight(.regular)
                .foregroundStyle(Color("SecondaryColor"))
            }
        }
    }
}

#Preview {
    LogInView()
        .environmentObject(AppRouter.shared)
    //        .environmentObject(AuthPresenter(router: AppRouter.shared))
        .environmentObject(AuthPresenter())
}