import SwiftUI

struct TabViewOfAPP: View {
    
    @StateObject var userStateViewModel:UserStateViewModel
    
    
    var body: some View {
        
        TabView {
            
            MainSCREEN()
                .tabItem {
                    Label(LocalizedStringKey("11"), systemImage: "doc.text.magnifyingglass")
                }
            
            ResponsesSCREEN()
                .tabItem {
                    Label(LocalizedStringKey("14"), systemImage: "hand.thumbsup")
                }
            
            ProfileSCREEN(userStateViewModel: userStateViewModel)
                .tabItem {
                    Label(LocalizedStringKey("17"), systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
        .transition(.opacity)
        .environment(\.locale, .init(identifier:  LanguageManager.shared.selectedLanguage.rawValue))
    }
}

#Preview {
    TabViewOfAPP(userStateViewModel: UserStateViewModel())
}
