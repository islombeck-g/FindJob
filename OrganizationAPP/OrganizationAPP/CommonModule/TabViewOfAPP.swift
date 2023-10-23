import SwiftUI

struct TabViewOfAPP: View {
    var body: some View {
        NavigationStack {
            TabView{
                
                MainView()
                    .tabItem {
                        Label("Главная", systemImage: "doc.text.magnifyingglass")
                    }
                
                ResponsesMainView()
                    .tabItem {
                        Label("Отклики", systemImage: "hand.thumbsup")
                    }
                
                ProfileMainView()
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                    }
                   
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    TabViewOfAPP()
}
