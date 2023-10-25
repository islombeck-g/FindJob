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
    
    @Published var cvArray:[CvData] = [CvData]()
    
    @Published var cv:CvData = CvData(
        age: 20,
        position: "IOS - developer",
        firstName: "Руслан",
        secondName: "Хамдамов",
        patronymicName: "Арсланович",
        birthDate: "25.12.2000",
        birthCountry: "Чехия",
        phoneNumber: "+998(97)231-43-21",
        university: "Казанский (Приволжский) Федеральный университет",
        institute: "Институт вычислительной математики и информационных технологий",
        direction: "Фундаментальная математика и информационные технологии",
        anotherEducation: "-",
        certificates: "IELTS 10",
        skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
        money: "от 100 000 до 300 000 руб",
        workExperience: "Лаборатория КФУ",
        employmentType: "Полная занятость",
        aboutMe: "Очень хороший человек")
    
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
    
    func appendNewCV(newCV:CvData){
        if newCV.position != "" && newCV.employmentType != "" && newCV.aboutMe != "" && newCV.university != "" {
            self.cvArray.append(newCV)
        } else {
            //need error
        }
        
    }

}
