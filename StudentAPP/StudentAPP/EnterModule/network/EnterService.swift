import Foundation

enum EnterServiceError: String, Error {
    case authenticationFailed = "Ошибка авторизации"
    case networkError = "Проверти подключение к сети"
    
}


class EnterService {
    
    var enterAPI = EnterAPI()
    
    func getFromAPI(completion: @escaping (StudentData) -> Void) {
        self.enterAPI.logIn { student in
            completion(student)
        }
    }
}
