import SwiftUI

struct CreateAccountView: View {
    
    @EnvironmentObject var presenter: AuthPresenter
    
    private var views: [AnyView] = [
        AnyView(PartOneOfRegistrationForm()),
        AnyView(PartTwoOfRegistrationForm())]
    
    @State private var selectedTab: Int = 0
    var body: some View {
        ZStack {
            Color("ForegroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                Group {
                    
                    Text(LocalizedStringKey("Регистрация"))
                        .mainSemiBold()
                        .foregroundStyle(Color("SecondaryColor"))
                }
                
                TabView(selection: self.$selectedTab) {
                    ForEach( self.views.indices, id: \.self) { i in
                        self.views[i]
                    }
                    .padding(.horizontal)
                    
                }
                .tabViewStyle(.page)
            }
        }
    }
}

#Preview {
    CreateAccountView()
        .environmentObject(AuthPresenter())
}

