import Foundation
import SwiftData

final class UserSwiftData {
    
    
    init() {
        
    }
}



enum Language: String, CaseIterable {
    case english = "en"
    case russian = "ru"
    case uzbek = "uz"
}

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()

    @Published var selectedLanguage: Language = .russian

    private init() {}
}




