import Foundation

final class ProfileViewModel: SupportViewModel, ObservableObject {
    
    @Published var student:StudentData = StudentData(
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
    
    @Published var newAboutMe: String = ""
    @Published var newBirthday: String = ""
    @Published var newInstitute: String = ""
    @Published var newDirection: String = ""
    @Published var newUniversity: String = ""
    
    private var userStateManager: UserStateManager
    
    init(userStateManager: UserStateManager) {
        self.userStateManager = userStateManager
        student = userStateManager.getUserData()
        newStudent = userStateManager.getUserData()
    }
    
    func getData() {
        self.student = userStateManager.getUserData()
        self.newStudent = self.student
    }
    
    private var service = ProfileService()
    @Published var isLoading: Bool = false
    func updateDataProfile() {
        self.isLoading = true
        self.service.updateUserData(userData: &newStudent) {
            self.student = self.newStudent
            self.isLoading = false
        } failure: { error in
            print(error)
            self.isLoading = false
        }

    }
    @Published var newStudent:StudentData = StudentData(
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
    
    func getNewDataToChange() {
        self.newStudent = self.student
    }
    func disableChanges() {
        self.newStudent = self.student
    }
    
    
    
    
    
    private var support = SupportViewModel()
    @Published var messages: [String] = ["Добро пожаловать в чат с поддержкой)\nпривет\nпроблема в\nхорошо" ]
    func sendMessageToSupport(text: String) {
        
        self.messages.append("[USER]" + text)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.messages.append(self.support.getResponse(message: text))
            
        }
    }
    
    func logOut(){
        self.userStateManager.logOut()
    }
}
