import SwiftUI

struct EnterView: View {
    
    @EnvironmentObject var viewModel:EnterViewModel
    
    @ObservedObject var languageManager = LanguageManager.shared
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("ForegroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Group {
                        Text("1")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        Text("2")
                            .font(.system(size: 20))
                            
                    }
                    .foregroundStyle(Color("SecondaryColor"))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    
                    Group {
                        NavigationLink {
                            LoginSCREEN1()
                                .environmentObject(self.viewModel)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 343, height: 46)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Text (LocalizedStringKey("3"))
                                    .foregroundStyle(Color("ForegroundColor"))
                                    .fontWeight(.bold)
                            }
                        }
 
                        NavigationLink {
                            RegistrationSCREEN()
                                .environmentObject(self.viewModel)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                                    .frame(width: 343, height: 46)
                                
                                Text(LocalizedStringKey("4"))
                                    .foregroundStyle(Color("SecondaryColor"))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    Group {
                        Menu {
                            
                            Button{
                                self.languageManager.selectedLanguage = .english
                            }label: {
                                Label("English", image: "en")
                            }
                            Button{
                                self.languageManager.selectedLanguage = .russian
                            }label: {
                                Label("Русский", image: "ru")
                            }
                            Button{
                                self.languageManager.selectedLanguage = .uzbek
                            }label: {
                                Label("Uzbek", image: "uz")
                            }
                            
                        } label: {
                            HStack {
                                Spacer()
                                Image(systemName: "globe.europe.africa.fill")
                                    .font(.system(size: 28))
                                    .fontWeight(.bold)
                                Spacer()
                                    .frame(width: 16)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    EnterView()
        .environmentObject(EnterViewModel(userStateManager: UserStateManager()))
}



struct LoginSCREEN1: View {
    
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
                        
                        LoginRoundedRectangleView1(
                            loginText: self.$viewModel.loginText,
                            passwodText: self.$viewModel.passwodText)
                        
                        .frame(
                            width: 343,
                            height: 287)
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                            .frame(height: 24)
                        
                        Text(LocalizedStringKey("6"))
                            .foregroundStyle(Color("SecondaryColor"))
                            .frame(maxWidth: .infinity)
                        
                      
                        Spacer()
                        Button {
                            self.viewModel.loginText = "123@gmail.com"
                            self.viewModel.passwodText = "123"
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(
                                        width: 343,
                                        height: 48)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Text("Test")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
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
    LoginSCREEN1()
        .environmentObject(EnterViewModel(userStateManager: UserStateManager()))
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
                    self.viewModel.tryRegistration()
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
//        .environmentObject(EnterViewModel(userStateManager: UserStateManager()))
//    
////    LoginRoundedRectangleView(loginText: .constant(""), passwodText: .constant(""))
////        .environmentObject(EnterViewModel(userStateViewModel: UserStateViewModel()))
//}
