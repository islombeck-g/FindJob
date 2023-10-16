import Foundation
import SwiftUI

final class RegistrationViewModel: ObservableObject {
    
    @Published var role: RolesEnum = .student
    
    @Published var StudentViews: [AnyView] = [
        AnyView(StudentFullNameView()),
        AnyView(StudentPositionView()),
        AnyView(StudentPasswordView())]
    @Published var OrganizationViews: [AnyView] = [
        AnyView(CompanyFullNameView()),
        AnyView(CompanyPositionView())]
    
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
    
    @Published var student:StudentIDData = StudentIDData(firstName: "", secondName: "", patronymicName: "", gender: .male, city: "", university: "", phoneNumber: "", image: "", email: "", password: "")
    @Published var organization: OrganizationIDData = OrganizationIDData(name: "", adress: "", phoneNumber: "", city: "", activity: "", description: "", image: "", email: "", password: "")
    
    @Published var secondPassword:String = ""
    @Published var emailAgree: Bool = false
    @Published var userAgreement: Bool = false
    @Published var chosenCity: String = "Город*"
    @Published var chosenUniversity: String = "Учебное заведение*"
    
    @Published var chosenCompanyActivity: String = "Сфера деятельности*"
    
}
