import Foundation
import SwiftData


final class CvViewModule:ObservableObject {
    
//    @Published var cvArray:[CvData] = [CvData]()
//    
   
    
}

@Model
final class CvData {
    
    var age:Int
    var position:String
    var firstName:String
    var secondName:String
    var patronymicName:String
    var birthDate:String
    var birthCountry:String
    var phoneNumber:String
    var university:String
    var institute:String
    var direction:String
    var anotherEducation:String
    var certificates:String
    var skills:String
    var money:String
    var workExperience:String
    var employmentType:String
    var aboutMe:String
    
    init(age: Int, position: String, firstName: String, secondName: String, patronymicName: String, birthDate: String, birthCountry: String, phoneNumber: String, university: String, institute: String, direction: String, anotherEducation: String, certificates: String, skills: String, money: String, workExperience: String, employmentType: String, aboutMe: String) {
        self.age = age
        self.position = position
        self.firstName = firstName
        self.secondName = secondName
        self.patronymicName = patronymicName
        self.birthDate = birthDate
        self.birthCountry = birthCountry
        self.phoneNumber = phoneNumber
        self.university = university
        self.institute = institute
        self.direction = direction
        self.anotherEducation = anotherEducation
        self.certificates = certificates
        self.skills = skills
        self.money = money
        self.workExperience = workExperience
        self.employmentType = employmentType
        self.aboutMe = aboutMe
    }
}


//    @Published var cv:CvData = CvData(
//        age: 20,
//        position: "IOS - developer",
//        firstName: "Руслан",
//        secondName: "Хамдамов",
//        patronymicName: "Арсланович",
//        birthDate: "25.12.2000",
//        birthCountry: "Чехия",
//        phoneNumber: "+998(97)231-43-21",
//        university: "Казанский (Приволжский) Федеральный университет",
//        institute: "Институт вычислительной математики и информационных технологий",
//        direction: "Фундаментальная математика и информационные технологии",
//        anotherEducation: "-",
//        certificates: "IELTS 10",
//        skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
//        money: "от 100 000 до 300 000 руб",
//        workExperience: "Лаборатория КФУ",
//        employmentType: "Полная занятость",
//        aboutMe: "Очень хороший человек")
