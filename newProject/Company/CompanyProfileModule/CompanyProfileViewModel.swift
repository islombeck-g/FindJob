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
    
    @Published var newINN: String = ""
    @Published var newName: String = ""
    @Published var newActivity: String = ""
    @Published var newDescription: String = ""
    @Published var newDateOfCreation: String = ""

    init() {
        
        self.newINN = self.company.INN ?? ""
        self.newName = self.company.name
        self.newActivity = self.company.activity
        self.newDescription = self.company.description
        self.newDateOfCreation = self.company.dateOfCreation ?? ""
    }
    
    func updateAfterChangeInEditView() {
        
    }
   
}

