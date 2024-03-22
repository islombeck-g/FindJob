import SwiftUI

struct CreateAccountView: View {
    
    @EnvironmentObject var presenter: AuthPresenter
    
    private var views: [AnyView] = [
        AnyView(PartOneOfRegistrationForm()),
        AnyView(PartTwoOfRegistrationForm())]
    
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
                
                TabView(selection: self.$presenter.nextView) {
                    ForEach( self.views.indices, id: \.self) { i in
                        self.views[i]
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}


#Preview {
    CreateAccountView()
        .environmentObject(AuthPresenter())
}
