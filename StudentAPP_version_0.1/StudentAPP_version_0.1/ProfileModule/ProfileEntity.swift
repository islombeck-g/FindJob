struct UserFullData: Codable {
    var firstName:String
    var secondName:String
    var patronymicName:String
    var gender:Gender
    var city:String
    var university:String
    var phoneNumber:String
    var image:String
    var birthDate:String
    var aboutMe:String
    var institute:String
    var direction:String
    
    let user: User
}
