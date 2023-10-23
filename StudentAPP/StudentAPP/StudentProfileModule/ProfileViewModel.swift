import Foundation

final class ProfileViewModel:ObservableObject {
    
    @Published var student:StudentData = StudentData(
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
    
    @Published var newAboutMe: String = ""
    @Published var newBirthday: String = ""
    @Published var newInstitute: String = ""
    @Published var newDirection: String = ""
    @Published var newUniversity: String = ""

    @Published var cvs:[CvData] = [CvData]()
    @Published var cv:CvData = CvData(
        firstName: "some name",
        secondName: "",
        patronymicName: "",
        birthDate: "",
        birthCountry: "",
        phoneNumber: "",
        university: "",
        institute: "",
        direction: "",
        anotherEducation: "",
        certificates: "",
        skills: "",
        money: "",
        workExperience: "",
        employmentType: "",
        aboutMe: "")
    init() {

        newBirthday = self.student.birthDate ?? ""
        newAboutMe = self.student.aboutMe ?? ""
        newInstitute = self.student.institute ?? ""
        newDirection = self.student.direction ?? ""
        newUniversity = self.student.university
        
    }
    
    func updateAfterChangeInEditView(){
        
        print(newBirthday, newAboutMe, newInstitute, newDirection, newUniversity)
        self.student.birthDate = newBirthday
        self.student.aboutMe = newAboutMe
        self.student.institute = newInstitute
        self.student.direction = newDirection
        self.student.university = newUniversity
        
        print(self.student)
    }

}