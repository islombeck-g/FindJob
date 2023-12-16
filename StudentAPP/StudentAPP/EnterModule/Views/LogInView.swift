import SwiftUI

struct LoginSCREEN: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(alignment: .leading){
                        
                        Group {
                            Spacer()
                                .frame(height: 37.5)
                            
                            Text(LocalizedStringKey("3"))
                                .foregroundStyle(Color("SecondaryColor"))
                                .font(.system(size: 34))
                                .fontWeight(.semibold)
                                .padding(.horizontal, 20)
                            
                            Spacer()
                                .frame(height: 24)
                        }
                        .padding(.leading, 8)
                        
                        LoginRoundedRectangleView(
                            loginText: self.$viewModel.loginText,
                            passwodText: self.$viewModel.passwodText)
                        .environmentObject(self.viewModel)
                        .frame(
                            width: 343,
                            height: 287)
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                            .frame(height: 24)
                        
                        Text(LocalizedStringKey("6"))
                            .foregroundStyle(Color("SecondaryColor"))
                            .frame(maxWidth: .infinity)
                        
                        Button {
                            self.viewModel.isLoading.toggle()
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
                
                if self.viewModel.isLoading {
                    LoadSpinnerView()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.dismiss()
                    } label: {
                        
                        Image(systemName: "chevron.left")
                        Text(LocalizedStringKey("5"))
                    }
                    .font(.system(size: 19))
                    .fontWeight(.regular)
                    .foregroundStyle(Color("SecondaryColor"))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.locale, .init(identifier: LanguageManager.shared.selectedLanguage.rawValue))
        
    }
    
}


#Preview {
    LoginSCREEN()
        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}
