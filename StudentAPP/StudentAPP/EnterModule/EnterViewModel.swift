import Foundation
import SwiftUI

final class EnterViewModel:ObservableObject {
    
    private var userStateManager: UserStateManager
    init(userStateManager: UserStateManager) {
        self.userStateManager = userStateManager
    }
    
    @Published var loginText: String = ""
    @Published var passwodText: String = ""
    @Published var isLoading:Bool = false
    private var enterService = EnterService()
    func tryLogin() {
        self.userStateManager.logIn(user: userTest)
    }
//    MARK: commented code is work, not touch, for release uncommit
//    func tryLogin() {
//        self.isLoading = true
////        self.userStateManager.logInTest()
////        MARK: it is works, just open
//        
//        self.enterService.login(userName: &loginText, password: &passwodText, success: { student in
//            
////            print("Login successful. Student data: \(student)")
//            DispatchQueue.main.async {
//                self.userStateManager.logIn(user: student)
//                self.isLoading = false
//            }
//            
//        }, failure: { error in
//            print("Login failed with error: \(error)")
//            DispatchQueue.main.async {
//                self.isLoading = false
//            }
//        })
//    }
    
    func tryRegistration() {
        self.isLoading = true
        
        enterService.registerUser(userData: &student, password: &passwodText, success: {
            // Обработка успешной регистрации
            DispatchQueue.main.async {
                self.userStateManager.logIn(user: self.student)
                self.isLoading = false
            }
        }, failure: { error in
            // Обработка ошибок регистрации
            print("Error: \(error)")
            DispatchQueue.main.async {
                self.isLoading = false
            }
        })
    }
    
    private func checkData() -> Bool {
        
        return true
    }
    
    //good
    func nextTabView(){
        guard selectedTab != 2 else {
            tryRegistration()
            return
        }
        self.selectedTab += 1
    }
    
    @Published var selectedTab: Int = 0
    
    @Published var StudentViews: [AnyView] = [
        AnyView(EnterFullNameView()),
        AnyView(EnterPositionView()),
        AnyView(EnterPasswordView())]
    @Published var cities:[ChoseName] = [
        .init(title: "Казань"),
        .init(title: "Москва"),
        .init(title: "Санкт-Питербург"),
        .init(title: "Воронеж"),
        .init(title: "Саратов"),
        .init(title: "Самара"),
        .init(title: "Тюмень"),
        .init(title: "Томск")]
    @Published var universitys:[ChoseName] = [
        .init(title: "Казанский(Приволжский) Федеральный Университет"),
        .init(title: "КАЗАНСКИЙ НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ"),
        .init(title: "Санкт-Питербургский Государственный Университет"),
        .init(title: "Московский Государственный Университет"),
        .init(title: "Казанский Национальный Иследовательский Технический Университет"),
        .init(title: "Казанский государственный медицинский университет"),
        .init(title: "Российский исламский институтка")]
    @Published var student:StudentData = StudentData(firstName: "", secondName: "", patronymicName: "", gender: .male, city: "", university: "", phoneNumber: "", image: "", email: "",  birthDate: "", aboutMe: "", institute: "", direction: "")
    
    @Published var secondPassword:String = ""
    @Published var emailAgree: Bool = false
    @Published var userAgreement: Bool = false
    @Published var chosenCity: String = "Город*"
    @Published var chosenUniversity: String = "Учебное заведение*"
    
    
//    MARK: for debug, on release remove this part of code
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
    
    
}


