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
    
    @Published var errorMessage = ""
    @Published var success = false
    private var enterService = EnterService()
    
    
    func tryRegistration() {
        self.userStateManager.logIn(user: userTest)
    }
//    func tryRegistration() {
////       new registration
//        self.isLoading = true
//        
//        guard checkData() else {
//            self.isLoading = false
//            self.errorMessage = "Uncorrect Input Data"
//            return
//        }
//        
//        enterService.userRegistration(email: &loginText, password: &passwodText) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let response):
//                    self.success = true
//                    break
//                case .failure(let error):
//                    self.errorMessage = error.localizedDescription
//                    break
//                }
//            }
//        }
//    }
    
//    func tryRegistration() {
//        self.isLoading = true
//        
//        enterService.registerUser(userData: &student, password: &passwodText, success: {
//            // Обработка успешной регистрации
//            DispatchQueue.main.async {
//                self.userStateManager.logIn(user: self.student)
//                self.isLoading = false
//            }
//        }, failure: { error in
//            // Обработка ошибок регистрации
//            print("Error: \(error)")
//            DispatchQueue.main.async {
//                self.isLoading = false
//            }
//        })
//    }
    
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


