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
                        Text(LocalizedStringKey("1"))
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        Text (LocalizedStringKey("2"))
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
                        Picker(selection: $languageManager.selectedLanguage, label: Text(LocalizedStringKey("Select Language"))) {
                            ForEach(Language.allCases, id: \.self) { language in
                                Text(language.rawValue).tag(language)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                }
            }
        }
        .environment(\.locale, .init(identifier: LanguageManager.shared.selectedLanguage.rawValue))
    }
}
#Preview {
    EnterSCREEN(userStateViewModel: UserStateViewModel())
}

