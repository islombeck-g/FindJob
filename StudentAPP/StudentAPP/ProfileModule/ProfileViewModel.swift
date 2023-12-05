import Foundation

//final class ProfileViewModel:SupportViewModel, CvViewModule ,ObservableObject {
final class ProfileViewModel: SupportViewModel, ObservableObject {
    @Published var student:StudentData
    
    @Published var newAboutMe: String = ""
    @Published var newBirthday: String = ""
    @Published var newInstitute: String = ""
    @Published var newDirection: String = ""
    @Published var newUniversity: String = ""
    
    private var userStateViewModel:UserStateViewModel
    
    private var support = SupportViewModel()
    @Published var messages: [String] = ["Добро пожаловать в чат с поддержкой)\nпривет\nпроблема в\nхорошо" ]
    
    init(userStateViewModel:UserStateViewModel) {
        self.userStateViewModel = userStateViewModel
        self.student = userStateViewModel.getUserData()
    }
    
    func sendMessageToSupport(text: String) {
        
        self.messages.append("[USER]" + text)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.messages.append(self.support.getResponse(message: text))
            
        }
    }
    
    
    func logOut(){
        self.userStateViewModel.logOut()
    }
    
    //good
    

    
}
