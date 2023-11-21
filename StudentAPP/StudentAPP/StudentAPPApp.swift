import SwiftUI

@main
struct StudentAPPApp: App {
    
    @StateObject var userStateViewModel = UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            if self.userStateViewModel.isLoggedIn {
                TabViewOfAPP(userStateViewModel: userStateViewModel)
            } else {
                EnterSCREEN(userStateViewModel: userStateViewModel)
            }
            
        }
    }
}
