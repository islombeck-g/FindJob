import Foundation
import SwiftUI
class RegistrationViewModel: ObservableObject {
    
    @Published var role: RolesEnum = .student
    
//    
//    @Published var StudentViews:[any View] = [
//        StudentFullNameView(),
//        StudentPositionView(),
//        StudentPasswordView()
//    ]
    
    
    @Published var StudentViews: [AnyView] = [
            AnyView(StudentFullNameView()),
            AnyView(StudentPositionView()),
            AnyView(StudentPasswordView())
        ]
}
