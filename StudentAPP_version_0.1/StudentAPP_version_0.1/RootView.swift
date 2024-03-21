import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: .auth)
                .navigationDestination(for: AppRoute.self) { route in
                    router.view(for: route)
                }
                .navigationBarTitleDisplayMode(.large)
                .interactiveDismissDisabled(false)
        }
    }
}
