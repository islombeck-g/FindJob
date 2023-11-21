import SwiftUI

struct TabViewOfAPP: View {
    
    @StateObject var userStateViewModel:UserStateViewModel
    
    
    var body: some View {
        
        TabView {
            
            MainSCREEN()
                .tabItem {
                    Label("Главная", systemImage: "doc.text.magnifyingglass")
                }
            
            ResponsesSCREEN()
                .tabItem {
                    Label("Отклики", systemImage: "hand.thumbsup")
                }
            
            ProfileSCREEN(userStateViewModel: userStateViewModel)
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
        .transition(.opacity)
    }
}

#Preview {
    TabViewOfAPP(userStateViewModel: UserStateViewModel())
}
