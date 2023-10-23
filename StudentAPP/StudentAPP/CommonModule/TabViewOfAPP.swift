import SwiftUI

struct TabViewOfAPP: View {
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
