import SwiftUI

struct TabViewOfAPP: View {
    
    @StateObject var userStateViewModel:UserStateViewModel
    
    
    var body: some View {
        
        TabView {
            
            MainView()
                .tabItem {
                    Label("Главная", systemImage: "doc.text.magnifyingglass")
                }
            
            ResponsesMainView()
                .tabItem {
                    Label("Отклики", systemImage: "hand.thumbsup")
                }
            
            ProfileMainView(userStateViewModel: userStateViewModel)
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
