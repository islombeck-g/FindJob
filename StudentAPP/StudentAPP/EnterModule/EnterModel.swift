import Foundation

enum Gender {
    case male
    case female
}

struct ChoseName {
    var title: String
}

struct StudentData {
    var firstName:String
    var secondName:String
    var patronymicName:String
    var gender:Gender
    var city:String
    var university:String
    var phoneNumber:String
    var image:String
    var email:String
    var password:String
    var birthDate:String?
    var aboutMe:String?
    var institute:String?
    var direction:String?
}