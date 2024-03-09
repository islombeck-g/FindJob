import Foundation

class AuthPresenter: ObservableObject {
    
    @Published var response: RegistrationResponse?
    @Published var error: Error?
    
    @Published var email:String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    
    private var authIteractor: AuthInteractor
    private var userStateManager: UserStateManager
    
    private var router: AppRouter = AppRouter.shared
    
    init() {
        self.authIteractor = AuthInteractor.shared
        self.userStateManager = UserStateManager.shared
    }
    func authenticate(){
        
    }
    
    func registration() {
        self.router.navigateTo(.mainTabView)
        //        self.isLoading = true
        
        //        authIteractor.userRegistration(email: self.email, password: self.password) { result in
        //
        //            switch result {
        //            case .success(let response):
        //                DispatchQueue.main.async {
        //                    self.updatePublishedResponse(response)
        ////                    self.router.navigateTo(.vacancyBoard)
        //                    print(response)
        //                }
        //            case .failure(let error):
        //                DispatchQueue.main.async {
        //                    self.error = error
        //                    self.isLoading = false
        //                    print(error)
        //                }
        //            }
        //        }
    }
    
    private func updatePublishedResponse(_ response: RegistrationResponse) {
        self.response = response
        self.isLoading = false
    }
}
