import Foundation
import SwiftUI

final class EnterViewModel:ObservableObject {
   
    @Published var loginText: String = ""
    @Published var passwodText: String = ""
 
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
    
    @Published var student:StudentData = StudentData(firstName: "", secondName: "", patronymicName: "", gender: .male, city: "", university: "", phoneNumber: "", image: "", email: "", password: "")

    
    @Published var secondPassword:String = ""
    @Published var emailAgree: Bool = false
    @Published var userAgreement: Bool = false
    @Published var chosenCity: String = "Город*"
    @Published var chosenUniversity: String = "Учебное заведение*"
  
    func nextTabView(){
        guard selectedTab != 3 else {
            selectedTab = 1
            return
        }
        self.selectedTab += 1
    }
    
    func checkData()-> Bool {
        return true
    }
    
    func sendData(){
        
    }
    
}


