import SwiftUI

struct TabViewOfAPP: View {
    
    @StateObject var userStateViewModel:UserStateViewModel
    
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
                
                ProfileMainView(userStateViewModel: userStateViewModel)
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                    }
                   
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    TabViewOfAPP(userStateViewModel: UserStateViewModel())
}
