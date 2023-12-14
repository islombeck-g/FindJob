import SwiftUI

struct EnterSCREEN: View {
    
    @StateObject var viewModel:EnterViewModel
    
    init(userStateViewModel: UserStateViewModel) {
        _viewModel = StateObject(wrappedValue: EnterViewModel(userStateViewModel: userStateViewModel))
            }
    
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
                            LoginSCREEN()
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
    EnterSCREEN(userStateViewModel: UserStateViewModel())
}

