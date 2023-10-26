import Foundation

final class ProfileViewModel:ObservableObject {
    
    @Published var student:StudentData
    
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
    
    private var userStateViewModel:UserStateViewModel
    
    init(userStateViewModel:UserStateViewModel) {
        self.userStateViewModel = userStateViewModel
        self.student = userStateViewModel.getUserData()
    }
    
    func logOut(){
        self.userStateViewModel.logOut()
    }
    
    //good
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
