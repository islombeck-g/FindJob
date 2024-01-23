import Foundation

final class UserStateManager: ObservableObject {
    static var shared = UserStateManager()
    
    init(){}
    
    @Published var isLoggedIn = false
//    MARK: User data
    private var user:StudentData?
    
    func logIn(user: StudentData) {
            self.user = user
            self.isLoggedIn = true
    }
    func logOut() {
        self.user = nil
        self.isLoggedIn = false
    }
    
    func getUserData() -> StudentData {
        return self.user!
    }
}
