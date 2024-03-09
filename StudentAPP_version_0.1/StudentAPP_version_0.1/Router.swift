import Foundation
import SwiftUI

enum AppRoute: Hashable {
    case auth
    case logIn
    case registration
    case vacancyBoard
}
class AppRouter: ObservableObject{
    
    static var shared = AppRouter()
    
    @Published var path: NavigationPath = NavigationPath()
    
    private var authPresenter = AuthPresenter()
    
    
    @ViewBuilder
    func view(for route: AppRoute) -> some View {
        switch route {
        case .auth:
            AuthView().environmentObject(authPresenter)
        case .logIn:
            LogInView().environmentObject(authPresenter)
        case .registration:
            RegistrationView().environmentObject(authPresenter)
        case .vacancyBoard:
            VacancyBoardView()
        }
    }
    func navigateTo(_ appRoute: AppRoute) {

        print("Navigating to: \(appRoute)")
        path.append(appRoute)
    }
    func navigateBack() {
        guard !path.isEmpty else {return}
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }
}





//class AppRouter: ObservableObject{
//
//    static var shared = AppRouter()
//    
//    @Published var currentRoutes: [AppRoute] = [.auth]
//   
//    func goBack() {
//        if currentRoutes.count > 1 {
//            currentRoutes.removeLast()
//        }
//    }
//    
//    func navigate(to route: AppRoute) {
//        currentRoutes.append(route)
//    }
//    func viewForRoute(_ route: AppRoute) -> AnyView {
//        switch route {
//        case .auth:
//            return AnyView(AuthView())
//        case .logIn:
//            return AnyView(LogInView())
//        case .registration:
//            return AnyView(RegistrationView())
//        }
//    }
//}
