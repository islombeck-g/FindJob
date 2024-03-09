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
