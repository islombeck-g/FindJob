import SwiftUI
import SwiftData

@main
struct StudentAPPApp: App {
    
    @StateObject var userStateViewModel = UserStateViewModel()
    @StateObject var languageManager = LanguageManager.shared
    var body: some Scene {
        WindowGroup {
            if self.userStateViewModel.isLoggedIn {
                TabViewOfAPP(userStateViewModel: userStateViewModel)
                    .environment(\.locale, .init(identifier: self.languageManager.selectedLanguage.rawValue))
            } else {
                EnterSCREEN(userStateViewModel: userStateViewModel)
                    .environment(\.locale, .init(identifier: self.languageManager.selectedLanguage.rawValue))
            }
        }
        .modelContainer(for: CvData.self)
    }
}
