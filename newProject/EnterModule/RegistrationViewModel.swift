import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var role: RolesEnum = .student
    
    @Published var StudentViews: [AnyView] = [
            AnyView(StudentFullNameView()),
            AnyView(StudentPositionView()),
            AnyView(StudentPasswordView())
        ]
    
    @Published var student:StudentIDData = StudentIDData(firstName: "", secondName: "", patronymicName: "", gender: .male, city: "", university: "", phoneNumber: "", image: "", email: "", password: "")
    
    @Published var secondPassword:String = ""
    @Published var emailAgree: Bool = false
    @Published var userAgreement: Bool = false

    
}
