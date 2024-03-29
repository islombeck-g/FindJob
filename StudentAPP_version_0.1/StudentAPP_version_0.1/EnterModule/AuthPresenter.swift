import Foundation
import Combine

class AuthPresenter: ObservableObject, NavigationRouter {
    
    @Published var response: RegistrationResponse?
    @Published var error: Error?
    
    @Published var email:String = ""
    @Published var emailError: LoginError?
    @Published var password: String = ""
    @Published var passwordError: LoginError?
    @Published var interactorError: LoginError?
    @Published var isLoading: Bool = false
    
    @Published var firstNameError: LoginError?
    @Published var secondNameError: LoginError?
    @Published var patronymicNameError: LoginError?
    @Published var birthDateError: LoginError?
    @Published var phoneNumberError: LoginError?
    @Published var universityError: LoginError?
    
    @Published var nextView: Int = 0
    
    @Published var user: UserFullData = UserFullData(image: "", firstName: "", birthDate: "", secondName: "", university: "Выберите университет*", phoneNumber: "", patronymicName: "")
    
    private var authIteractor: AuthInteractor
    private var userStateManager: UserStateManager
    private var router: AppRouter = AppRouter.shared
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        self.authIteractor = AuthInteractor.shared
        self.userStateManager = UserStateManager.shared
    }
    
//    MARK: - work with Interactor
    func authenticate() {
        
    }
    
    func registration() {
        self.isLoading = true
        
        authIteractor.userRegistration(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                
                switch completion {
                case .finished:
                    self?.navigateTo(route: .createAccount)
                case .failure(let error):
                    self?.interactorError = error as? LoginError
                }
            } receiveValue: { [weak self] response in
                self?.updatePublishedResponse(response)
            }
            .store(in: &cancellables)
    }
    
    func registrationPartTwo() {
        self.isLoading = true
        
        authIteractor.userRegistrationPartTwo(userData: self.user)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.interactorError = error as? LoginError
                }
            } receiveValue: { response in
                print(response)
            }.store(in: &cancellables)
    }
    
//    MARK: navigation
    func navigateTo(route: AppRoute) {
        self.clearErrors()
        self.router.navigateTo(route: route)
    }
    
    func navigateBack() {
        self.router.navigateBack()
        self.clearErrors()
        self.nextView = 0
    }
    
    func popToRoot() {}
    
    
    
    func checkPartOne() -> Bool {
        
        self.clearErrors()
        //        MARK: forDebug
//        return true
        //        MARK: endDebug
        if self.user.firstName == "" {
            self.firstNameError = .firstNameEmpty
        }
        if self.user.secondName == "" {
            self.secondNameError = .secondNameEmpty
        }
        if self.user.patronymicName == "" {
            self.patronymicNameError = .patronymicNameEmpty
        }
        if self.user.birthDate == "" {
            self.birthDateError = .birthDateEmpty
        }
        
        return firstNameError == nil && secondNameError == nil && patronymicNameError == nil && birthDateError == nil
    }
    
    func checkPartTwo() -> Bool {
        
        self.clearErrors()
        //        MARK: forDebug
//        return true
        //        MARK: endDebug
        
        if self.user.university == "Выберите университет*" {
            self.universityError = .notChosenUniversity
        }
        if self.user.phoneNumber.isEmpty {
            self.phoneNumberError = .phoneNumberEmpty
        }
        return universityError == nil && phoneNumberError == nil
    }
    
    private func isValid() -> Bool {
        
        self.clearErrors()
        
        if self.email.isEmpty {
            self.emailError = .emailEmpty
        } else if !self.email.isValidEmail {
            self.emailError = .emailInvalid
        }
        
        if password.isEmpty {
            self.passwordError = .passwordEmpty
        } else if password.count < 6 {
            self.passwordError = .passwordShort
        } else if password.count > 20 {
            self.passwordError = .passwordLong
        }
        return emailError == nil && passwordError == nil
    }
    
    private func clearErrors() {
        self.emailError = nil
        self.passwordError = nil
        self.firstNameError = nil
        self.secondNameError = nil
        self.patronymicNameError = nil
        self.birthDateError = nil
        self.universityError = nil
        
    }
    
    private func updatePublishedResponse(_ response: RegistrationResponse) {
        self.response = response
        self.isLoading = false
    }
}



//MARK: - old code
//    func registration() {
//
//        guard self.isValid() else { return }
//        //        self.isLoading = true
//                self.updatePublishedResponse(RegistrationResponse(accessToken: "", refreshToken: " ", user: User(email: "some@gmail.com", id: "sdf", role:"sdf", password:" dsfsdf", isActivated: false)))
//        self.router.navigateTo(route: .createAccount)
//
//        authIteractor.userRegistration(email: self.email, password: self.password) { result in
//
//            switch result {
//
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.updatePublishedResponse(response)
//                    self.navigateTo(route: .createAccount)
//                    print(response)
//                }
//
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.error = error
//                    self.isLoading = false
//                    print(error)
//                }
//            }
//        }
//    }
