import Foundation

enum RolesEnum {
    case student
    case organization
}

enum Gender {
    case male
    case female
}

struct StudentIDData {
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
}

struct OrganizationIDData {
    var name:String
    var adress:String
    var phoneNumber:String
    var city:String
    var activity:String
    var description:String
    var image:String
    var email:String
    var password:String
}
