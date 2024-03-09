import Foundation

final class UserStateManager: ObservableObject {
    
    static var shared = UserStateManager()
    
    init(){}
    
    @Published var isLoggedIn = false
    
//    MARK: User data
    private var response:RegistrationResponse?
    
    func logIn(response: RegistrationResponse) {
        self.response = response
        self.isLoggedIn = true
    }
    func logOut() {
        self.response = nil
        self.isLoggedIn = false
    }
    
    func getUserData() -> User {
        return self.response!.user
    }
}
