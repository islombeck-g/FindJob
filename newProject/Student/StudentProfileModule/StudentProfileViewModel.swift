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
        password: "what???")
}
