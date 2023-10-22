import Foundation

final class CompanyProfileViewModel:ObservableObject {
    
    @Published var company:OrganizationIDData = OrganizationIDData(
        name: "Какая-то компания",
        adress: "Кремлёвская 35",
        phoneNumber: "+7 (888) 888-88-88",
        city: "Казань",
        activity: "Информационные технологии, системная интеграция, интеренет",
        description: "Очень хорошая айтишная компания, всегда рады знакомствам",
        image: "",
        email: "someCompany@gmail.com",
        password: "noPassword",
        dateOfCreation: "10.02.2000",
        INN: "111111111111111"
        )
    
}

