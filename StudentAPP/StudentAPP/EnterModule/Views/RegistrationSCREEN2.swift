

import SwiftUI

struct RegistrationSCREEN2: View {
    
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
                            
                            Text(LocalizedStringKey("Регистрация"))
                                .foregroundStyle(Color("SecondaryColor"))
                                .font(.system(size: 34))
                                .fontWeight(.semibold)
                                .padding(.horizontal, 20)
                            
                            Spacer()
                                .frame(height: 24)
                        }
                        .padding(.leading, 8)
                        
                        LoginRoundedRectangleView1(
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
                        
                        NavigationLink {
                            
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
    RegistrationSCREEN2()
        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
}

struct LoginRoundedRectangleView1: View {
    
    @EnvironmentObject var viewModel: EnterViewModel
    @Binding var loginText:String
    @Binding var passwodText:String

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 287)
                .foregroundStyle(Color("SecondaryColor"))
            
            VStack(alignment: .center) {
                Text(LocalizedStringKey("7"))
                    .foregroundStyle(Color("ForegroundColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                CustomTextFieldView(isSecureField: false, text: LocalizedStringKey("8"), result: self.$loginText)
                
                Spacer()
                    .frame(height: 10)
                
                CustomTextFieldView(isSecureField: true, text: LocalizedStringKey("9"), result: self.$passwodText)
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    self.viewModel.register()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 293, height: 50)
                            .foregroundColor(Color("AccentColor"))
                        
                        Text(LocalizedStringKey("3"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
                Button{
                    
                }label: {
                    Text(LocalizedStringKey("10"))
                        .font(.system(size: 15))
                        .underline()
                        .foregroundStyle(Color("ForegroundColor"))
                }
            }
        }
        
    }
}

//#Preview {
//    LoginSCREEN()
//        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
//    
////    LoginRoundedRectangleView(loginText: .constant(""), passwodText: .constant(""))
////        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
//}
