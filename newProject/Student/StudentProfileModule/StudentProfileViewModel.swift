import Foundation

final class StudentProfileViewModel: ObservableObject {
    
    @Published var student:StudentIDData = StudentIDData(
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
    
}
