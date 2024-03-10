import SwiftUI

struct MainTabView: View {
    
    @StateObject private var vacancyPresenter = VacancyBoardPresenter()
    @StateObject private var profilePresenter = ProfilePresenter()
   
    var body: some View {
        TabView {
            
            VacancyBoardView()
                .tabItem {
                    Label("Главная", systemImage: "doc.text.magnifyingglass")
                }
                .environmentObject(vacancyPresenter)
            ResponsesView()
                .tabItem {
                    Label("Отклики", systemImage: "hand.thumbsup")
                }
            
            
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
                .environmentObject(profilePresenter)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainTabView()
}
