import Foundation

final class ProfileViewModel: ObservableObject {
    
    @Published var organization:OrganizationData = OrganizationData(
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
        
        self.newINN = self.organization.INN ?? ""
        self.newName = self.organization.name
        self.newActivity = self.organization.activity
        self.newDescription = self.organization.description
        self.newDateOfCreation = self.organization.dateOfCreation ?? ""
    }
    
    func updateAfterChangeInEditView() {
        
    }
   
    
}
