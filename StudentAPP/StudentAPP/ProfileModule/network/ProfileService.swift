import Foundation

enum ProfileServiceError: String {
    case networkError = "Ошибка соединения"
    case encodingError = "Ошиюка создания json файла"
    case invalidResponse = "какая то ошибка"
    case updateProfileFailed = "Ошибка в обновлении профиля"
}

final class ProfileService {
    
    let profileAPI = ProvileAPI()
    
    func updateUserData (userData: inout StudentData, success: @escaping ()-> Void, failure: @escaping (ProfileServiceError) -> Void) {
        self.profileAPI.updateProfile(userData: &userData) { error in
            if let error = error {
                failure(error)
            } else {
                success()
            }
        }
    }
}
