import SwiftUI

struct MainTabView: View {
    
    @StateObject private var vacancyPresenter = VacancyBoardPresenter()
    
    var body: some View {
        TabView {
            
            VacancyBoardView()
                .tabItem {
                    Label("Главная", systemImage: "doc.text.magnifyingglass")
                }
                .environmentObject(vacancyPresenter)
            ProfileView()
                .tabItem {
                    Label("Отклики", systemImage: "hand.thumbsup")
                }
            
            ResponsesView()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainTabView()
}
