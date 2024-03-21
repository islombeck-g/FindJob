import Foundation

struct User: Codable {
    let email: String
    let id: String
    let role: String
    let password: String
    let isActivated: Bool
}

struct RegistrationResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let user: User
}

enum EnterServiceError: Error {
    case networkError
    case invalidResponse
    case loginFailed
    case noData
    case jsonDecodingError
    case registrationFailed
    case invalidURL
    case encodingError
}

enum Gender:String, Decodable, Encodable {
    case male = "male"
    case female = "female"
}

enum LoginError: Error, LocalizedError {
    
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    case passwordShort
    case passwordLong
    case firstNameEmpty
    case secondNameEmpty
    case patronymicNameEmpty
    case birthDateEmpty
    
    var errorDescription: String? {
        
        switch self {
        
        case .emailEmpty:
            return "Почта не может быть пустой"
        
        case .emailInvalid:
            return "Почта введена в неправельном формате"
            
        case .passwordEmpty:
            return "Пароль не может быть пустым"
            
        case .passwordShort:
            return "Пароль слишком короткий"
        
        case .passwordLong:
            return "Пароль слишком длинный"
            
        case .firstNameEmpty:
            return "Имя не может быть пустым"
            
        case .secondNameEmpty:
            return "Фамилия не может быть пустым"
            
        case .patronymicNameEmpty:
            return "Отчество не может быть пустым"
       
        case .birthDateEmpty:
            return "День рождения не может быть пустым"
        }
    }
}

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predivate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predivate.evaluate(with: self)
    }
}

let universities: [ChoseName] = [
    .init(title: "Казанский(Приволжский) Федеральный Университет"),
    .init(title: "КАЗАНСКИЙ НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ"),
    .init(title: "Санкт-Питербургский Государственный Университет"),
    .init(title: "Московский Государственный Университет"),
    .init(title: "Казанский Национальный Иследовательский Технический Университет"),
    .init(title: "Казанский государственный медицинский университет"),
    .init(title: "Российский исламский институтка")]
