import SwiftUI
import SwiftData

@main
struct StudentAPPApp: App {
    @StateObject var languageManager = LanguageManager.shared
    @StateObject var userStateManager = UserStateManager.shared
    
    var body: some Scene {
        WindowGroup {
            if self.userStateManager.isLoggedIn {
                TabViewOfAPP()
                    .environmentObject(self.userStateManager)
                    .environment(\.locale, .init(identifier: self.languageManager.selectedLanguage.rawValue))
                    
            } else {
//                EnterView()
                EnterSCREEN()
                    .environmentObject(EnterViewModel(userStateManager: userStateManager))
                    .environment(\.locale, .init(identifier: self.languageManager.selectedLanguage.rawValue))
            }
        }
        .modelContainer(for: CvData.self)
    }
}


let url = "https://6a16-81-222-188-63.ngrok-free.app"

