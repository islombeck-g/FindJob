import Foundation

class UserStateViewModel:ObservableObject{
    
    @Published var isLoggedIn = false
    
    private var user:StudentData = StudentData(
            firstName: "SomeName",
            secondName: "someSecondName",
            patronymicName: "somePatronymicName",
            gender: .male,
            city: "Москва",
            university: "Московский Государственный Университет",
            phoneNumber: "+7 (888) 888-88-88",
            image: "userImage",
            email: "some@gmail.com",
            password: "what???",
            birthDate: "10.02.2000",
            aboutMe: "я очень интреесный человек, учусь, не работаю",
            institute: "Институт вычислительной математики и информационных техноолгий",
            direction: "Фундаментальная информатики и информационные технологии")
    
    func logIn(user: StudentData) {
        self.isLoggedIn = true
    }
    
    func logOut() {
        
        self.isLoggedIn = false 
    }
    
    func getUserData() -> StudentData {
        
        return self.user
    }
}
