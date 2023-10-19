import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationStack {
            TabView{
                
                StudentMainView()
                    .tabItem {
                        Label("Главная", systemImage: "doc.text.magnifyingglass")
                    }
                
                StudentResponsesMainView()
                    .tabItem {
                        Label("Отклики", systemImage: "hand.thumbsup")
                    }
                
                StudentProfileMainView()
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                    }
                   
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    MainTabView()
}
