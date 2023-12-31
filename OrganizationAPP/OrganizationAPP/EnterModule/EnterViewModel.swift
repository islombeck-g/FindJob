import Foundation
import SwiftUI

final class EnterViewModel:ObservableObject {
    
    @Published var loginText: String = ""
    @Published var passwodText: String = ""
    
    @Published var selectedTab: Int = 0
    
    @Published var EnterViews: [AnyView] = [
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
    @Published var companyActivity: [ChoseName] = [
        .init(title: "Автомобильный бизнес"),
        .init(title: "Гостиница, рестораны, общепит, кейтеринг"),
        .init(title: "Государственные органы"),
        .init(title: "Добывающая отрасль"),
        .init(title: "ЖКХ"),
        .init(title: "Информационные технологии, системная интеграция, интеренет"),
        .init(title: "Искусство, культура"),
        .init(title: "Лесная промышленность, деревообработка"),
        .init(title: "Медицина, фармацевтика, аптека"),
        .init(title: "Металлургия, мателлообработка"),
        .init(title: "Нефть и газ"),
        .init(title: "Образовательные учреждения"),
        .init(title: "Общественная деятельность, партии, благотворительность, НКО"),
        .init(title: "Перевозки, логистика, склад, ВЭД")]
    
    @Published var organization: OrganizationData = OrganizationData(name: "", adress: "", phoneNumber: "", city: "", activity: "", description: "", image: "", email: "", password: "")
    
    
    @Published var secondPassword:String = ""
    @Published var emailAgree: Bool = false
    @Published var userAgreement: Bool = false
    @Published var chosenCity: String = "Город*"
    @Published var chosenCompanyActivity: String = "Сфера деятельности*"
    
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


