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
        return self.user ?? userTest
    }
    
//    MARK: for debug
    private var userTest:StudentData = StudentData(
            firstName: "testUser",
            secondName: "testUser",
            patronymicName: "testUser",
            gender: .male,
            city: "testUser",
            university: "Московский Государственный Университет",
            phoneNumber: "+7 (888) 888-88-88",
            image: "userImage",
            email: "some@gmail.com",
            birthDate: "10.02.2000",
            aboutMe: "я очень интреесный человек, учусь, не работаю",
            institute: "Институт вычислительной математики и информационных техноолгий",
            direction: "Фундаментальная информатики и информационные технологии")
    func logInTest() {
        self.isLoggedIn = true
    }
}
