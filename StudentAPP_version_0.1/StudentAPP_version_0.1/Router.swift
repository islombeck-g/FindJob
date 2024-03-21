import Foundation
import SwiftUI

enum AppRoute: Hashable {
    case auth
    case logIn
    case registration
    case mainTabView
    case vacancyBoard
    case vacationDetail(job: Job, isFavourite: Bool)
    case cv
    case cvCreate
    case cvDetail(cv: CvData)
    case cvUpdate(cv: CvData)
    case support
}
protocol NavigationRouter {
    func navigateTo(route: AppRoute)
    func navigateBack()
    func popToRoot()
}

class AppRouter: ObservableObject, NavigationRouter {
    
    static let shared = AppRouter()

    @Published var path: NavigationPath = NavigationPath()
    
    @ViewBuilder
    func view(for route: AppRoute) -> some View {
        switch route {
        
        case .auth:
            AuthView()
            
        case .logIn:
            LogInView()
            
        case .registration:
            RegistrationView()
            
        case .vacancyBoard:
            VacancyBoardView()
            
        case .mainTabView:
            MainTabView()
            
        case .vacationDetail(job: let job, isFavourite: let isFavourite):
            VacancyDetailView(vc: job, isFavorite: isFavourite)
            
        case .cv:
            CvView()
            
        case .cvCreate:
            CvCreateView()
            
        case .cvDetail(cv: let cv):
            CvDetailView(cv: cv)
            
        case .cvUpdate(cv: let cv):
            CvUpdateView(cv: cv)
            
        case .support:
            SupportView()
        }
    }
    func navigateTo(route: AppRoute) {
        path.append(route)
    }
    func navigateBack() {
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
